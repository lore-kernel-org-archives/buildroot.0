From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 12 Mar 2013 17:53:53 +0100
Subject: [Buildroot] Configuring Buildroot menuconfig to show current
 directory within Linux shell
In-Reply-To: <1363105579.93717.YahooMailNeo@web172406.mail.ir2.yahoo.com>
References: <1363105579.93717.YahooMailNeo@web172406.mail.ir2.yahoo.com>
Message-ID: <CAAXf6LX8UwPjv2EM1ipX3tsTUDY31SFnVeiJ3_T51gHEfT3i1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Daniele,

On Tue, Mar 12, 2013 at 5:26 PM, Daniele Romano
<romanodaniele71@yahoo.it> wrote:
> Hi, all.
>
> I'm looking for the way, within the Buildroot configuration menu options, to
> let
> the Linux shell show the current directory the logged user is actually in.
> Hithertho, whatever directory I'm in, the shell always shows "#".
> Is there any option to activate this feature?

This behavior is handled by the shell (in turn typically provided by
busybox), using variable PS1.
For example, setting it to:

PS1='\u@\h:\w\$ '

will show you the username, hostname, and current directory.
The buildroot default configuration has a fixed setting, but you could
create an executable file /etc/profile.d/prompt.sh (the name 'prompt'
is arbitrary) in which you can set PS1 to the value you like.
This file will be read when creating a new login shell, via /etc/profile.

Best regards,
Thomas
