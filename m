From: Steve Kenton <skenton@ou.edu>
Date: Fri, 12 May 2017 19:10:43 +0000
Subject: [Buildroot] Problems building iotop
In-Reply-To: <CA+12NBL_ABjQZETEs4xUVZf8kcCW4+Qm1KEafXxbZi7o1VzK1g@mail.gmail.com>
References: <CA+12NB+dzKMw2x=mBESq+Ti0COMiQmbHTiRaO=E35xOZch+4gw@mail.gmail.com>
 <20170511174933.28030e0a@free-electrons.com>
 <CA+12NBKcGynVqiynZvETmSQEdLr138tM9s8n32RpwDgE1w7ABg@mail.gmail.com>
 <20170512161308.1881fcb5@free-electrons.com>
 <CA+12NBL_ABjQZETEs4xUVZf8kcCW4+Qm1KEafXxbZi7o1VzK1g@mail.gmail.com>
Message-ID: <20edd995-fdbe-2753-f26d-2ebe6ae0ec26@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Be aware that the dependencies can be quite complex. I have had problems 
even when slipstreaming things like xorriso-1.4.2 to to xorriso-1.4.4.

To add a package do something along these lines:

Construct a directory for the package formatted like those already in 
packages directory, see the Buildroot documentation. In the example 
below it contains only Config.in  and libltc.mk because the hash file 
can be omitted for testing.

Add it to the packages/Config.in file doing something like the below:

# My attempt to add libltc as a buildroot package for future use
# Note that libltc has not yet been submitted to upstream buildroot
sed --in-place '/    source "package\/liblo\/Config.in"/a \ source 
"package/libltc/Config.in"' package/Config.in
rm --recursive --force package/libltc
mv ../libltc package/


make menuconfig should now allow you to select it.

Good luck.

Steve Kenton



On 05/12/2017 05:31 PM, Linux User wrote:
> I do understand that. But for 1 package, I dont want to upgrade to 
> entire BR. What I am trying to do should be possible. Isn't it ? If 
> you can give me some pointers, I dont mind, working on it.
>
> On Fri, May 12, 2017 at 10:13 AM, Thomas Petazzoni 
> <thomas.petazzoni@free-electrons.com 
> <mailto:thomas.petazzoni@free-electrons.com>> wrote:
>
>     Hello,
>
>     On Fri, 12 May 2017 09:51:57 -0400, Linux User wrote:
>
>     > Posting again, with the maillist in cc.
>     >
>     > I am using 2013 version of BR.
>     >
>     > Oh my buildroot is already setup. I am build everything else
>     just fine but
>     > iotop.
>
>     Buildroot 2013 is really old. The iotop package was added in Buildroot
>     2015.05.
>
>     Best regards,
>
>     Thomas
>     --
>     Thomas Petazzoni, CTO, Free Electrons
>     Embedded Linux and Kernel engineering
>     http://free-electrons.com
>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__free-2Delectrons.com&d=DwMFaQ&c=qKdtBuuu6dQK9MsRUVJ2DPXW6oayO8fu4TfEHS8sGNk&r=XPAqbAKvOH6479pBB2izug&m=gs4abqpaeB6ilihhJKXUWlbNxCBfs1ajB_PcNyC4kg4&s=YdV0uqzu2uAKfmQa1aln7P7qKzKP4l76AYL7JkiCFUw&e=>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170512/c5fea06f/attachment.html>
