From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 12 Sep 2013 18:18:06 +0200
Subject: [Buildroot] Building Manual Errors
In-Reply-To: <OF433C040C.2486075F-ON86257BE2.00813B52-86257BE2.0082DB6E@rockwellcollins.com>
References: <OF433C040C.2486075F-ON86257BE2.00813B52-86257BE2.0082DB6E@rockwellcollins.com>
Message-ID: <CAAXf6LWJ8DM-UBfEi=quWo7g-g_RGSYuRgEJM_y__mh+10F3pQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,


On Wed, Sep 11, 2013 at 1:49 AM, <rjbarnet@rockwellcollins.com> wrote:
[..]
>
> On my Ubuntu 12.04 machine I can succesfully build the HTML version of the manual but not the text version
>
> user at ubuntu:~/projects/buildroot/mainline$ make manual-txt
> Writing the target-packages list in:
>         output/docs/manual/.build/package-list.txt
> Writing the host-packages list in:
>         output/docs/manual/.build/host-package-list.txt
> Writing the deprecated list in:
>         output/docs/manual/.build/deprecated-list.txt
> a2x: ERROR: w3m -cols 70 -dump -T text/html -no-graph /home/user/projects/buildroot/mainline/output/docs/manual/manual.text.html > /home/user/projects/buildroot/mainline/output/docs/manual/manual.text returned non-zero exit status 127
> make: *** [output/docs/manual/manual.text] Error 1
>
> I've seen in the manual that there is an issue with building the manual with debain but it really doesn't explain what that issue. I tried searching the mailing list for this issue along with bugzilla but came up empty handed in finding the exact issue. Its not the end of the world for me since I can kind of work around. Also if somebody has a known working configuration for building the manual that would be helpful to know.

In fact, I have the same thing, but the actual problem is that w3m is
missing on the system, which can be fixed with 'sudo apt-get install
w3m'. After this, the text version builds fine.

Samuel: shouldn't we check the dependencies for building the manual
before someone attemps to do that? On my Linux Mint system
(=Ubuntu-based) I had to install asciidoc (which pulled in a lot of
tex deps) and w3m.

Best regards,
Thomas
