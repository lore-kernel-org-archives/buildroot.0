From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 08 Jun 2012 16:50:37 +0200
Subject: [Buildroot] busybox 1.18.3 to 1.18.4
In-Reply-To: <CALo-6+h1Yq_rM_1inqvMVr8X14q45zBmoy_Zeo937G5p2uxWww@mail.gmail.com>
References: <CALo-6+h1Yq_rM_1inqvMVr8X14q45zBmoy_Zeo937G5p2uxWww@mail.gmail.com>
Message-ID: <4FD2113D.1090302@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

Charles Krinke wrote:
> I am just finishing a project with buildroot-2011.03 and need to
> change one thing before the end and that is the version of busybox
> from 1.18.3 to 1.18.4.
>
> Make xconfig does not have a 1.18.4 option for this version and
> editing .config doesnt work. That is, the next make changes the
> busybox version back from 1.18.4 to 1.18.3.
>
> Can someone please tell me which other file would need to be changed
> so that I can change the project from busybox 1.18.3 to 1.18.4.
>

In file package/busybox/Config.in there's a section looking like this:

config BR2_BUSYBOX_VERSION
         string
         default "1.15.3"        if BR2_BUSYBOX_VERSION_1_15_X
         default "1.16.2"        if BR2_BUSYBOX_VERSION_1_16_X
         default "1.17.4"        if BR2_BUSYBOX_VERSION_1_17_X
         default "1.18.3"        if BR2_BUSYBOX_VERSION_1_18_X

You can change "1.18.3" to "1.18.4" (or, maybe better, "1.18.5", as it is a
bugfix release).

Then run make menuconfig again and exit saving for the .config to be 
updated.

Luca
