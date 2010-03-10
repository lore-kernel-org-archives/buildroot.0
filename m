From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 10 Mar 2010 12:21:06 +0000
Subject: [Buildroot] [buildroot] [Xorg] [mouse] Mouse don't move
In-Reply-To: <4bdad2c51003100414vc1f0d37q9e9096a86fd78a30@mail.gmail.com>
References: <4bdad2c51003100414vc1f0d37q9e9096a86fd78a30@mail.gmail.com>
Message-ID: <4B978EB2.80001@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/2010 12:14, Alexander Trousevitch wrote:
> Hi, all.
>
> I'm trying to make a tiny linux-based OS, using buildroot, for 
> terminal stations.
>
> I'm using latest buildroot (2010.02) and i've compiled it with this 
> configuration:
>
> 1. busybox
> 2. modular X.org
>     vesa driver
>     xf86-mouse-input driver
>     xf86-keyboard-input driver
> 3. 2.6.22.5 kernel is build manually, modules are copied into 
> /lib/2.6.22.5 <http://2.6.22.5/>.
>
> I've faced some problems with vesa driver, but now it's ok.
>
> THE PROBLEM: When i'm starting X, mouse cursor appears, but mouse 
> don't move.
>

I had a similar problem and fixed it by adding

Option         "AllowEmptyInput" "off"

to the ServerLayout section

Regards
Will
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100310/444b1bcb/attachment.htm>
