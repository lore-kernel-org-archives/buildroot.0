From: Ozgun <ozgun.gunay@gmail.com>
Date: Wed, 15 Feb 2012 21:35:25 +0200
Subject: [Buildroot] opencv with glibc
In-Reply-To: <CAHXCMM+_TrnpuCA6C_8MbVkd1gyZLBmJ3kihufb-5snLguUs_A@mail.gmail.com>
References: <CAPeX=+tCiegGOeD2bi9+v8aOVrB=FjHo3XEAvp1b5tNfR85N-w@mail.gmail.com>
 <CAPeX=+ubBEJeR9s+gH8ACDpUToXLA_rDqDwL4NT44BZ-PsfFsA@mail.gmail.com>
 <CAHXCMMKLFopuH8ubCnaY2_1oKkXf-wXHmzV_Fvo77NAutCKOcw@mail.gmail.com>
 <CAPeX=+s407S8aNwEZnKD4UAzJjR15-+juPYrJdXR+T4sEg6wEQ@mail.gmail.com>
 <CAHXCMM+_TrnpuCA6C_8MbVkd1gyZLBmJ3kihufb-5snLguUs_A@mail.gmail.com>
Message-ID: <CAPeX=+vQJu2j2+auOTr8+q18hNa7q_ZD848Hj7B+DPGSJ8RDxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My br doesn't have output/toolchainfile.cmake file

15 ?ub 2012 20:15 tarihinde "Samuel Martin" <s.martin49@gmail.com> yazd?:
>
> 2012/2/15 Ozgun <ozgun.gunay@gmail.com>:
> >
> > I can compile with glibc library without any problem. But when I
choose/add
> > opencv, buildroot installs CMAKE to TARGET just before opencv and then
CMAKE
> > try to configure opencv, meanwhile CMAKE assumes uclibc.
> > I changed  CMAKETARGET  to AUTOTARGETS then buildroot give ./configure
file
> > is not exist.
> > I understand that opencv has a special configuration management system
via
> > CMAKE, and CMAKE has some problems with crosstool-ng toolchain.
> >
>
> Actually opencv is a cmake target, you cannot (easily) change that !
> Cmake is the alternative to the autotools used by opencv.
>
> The problem is that BR generate the output/toolchainfile.cmake that
> describe the toolchain you're currently using,
> But unfortunately, this file is wrong, it does not match your current
> toolchain; it cerlainly one of your previous configuration.
>
> So, removing output/toolchainfile.cmake will make BR regenerate it
> according to the current configuration during the next build.
> Then, when cmake will be called to configure opencv, the
> toolchainfile.cmake passed as argument will be correct.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120215/5e8bae8d/attachment.html>
