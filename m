From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 May 2012 22:51:37 +0200
Subject: [Buildroot] (newbie question)
In-Reply-To: <20120515224254.6bff263a@skate>
References: <CAFC29aU6nfLkHpbs1mKhV13aVdtskqtKtCpURpzi-gQErviriQ@mail.gmail.com>
 <20120515224254.6bff263a@skate>
Message-ID: <4FB2C1D9.4030809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/15/12 22:42, Thomas Petazzoni wrote:
> Hello,
>
> Le Tue, 15 May 2012 13:28:02 -0700,
> Ron Eggler<reggler@semiosbio.com>  a ?crit :
>
>> I downloaded a build root archive that compiles for my Synapse E-10
>> (running ARM9) that works fine. I wanted to add several packages to it, I
>> added folders in the package/ directory and added Config.in and
>> package.mkfiles as described on
>> http://buildroot.uclibc.org/buildroot.html#add_packages (also added it to
>> package/Config.in but for some reason, I don't seem to get the binaries in
>> my final build, why would that be?
>
> Can you post the patch adding your packages? Without looking at your
> Config.in and<pkg>.mk file, it is merely impossible to help you in
> understanding why your binaries aren't installed in the target
> filesystem.

  But first some sanity checks:

1. Did you select the new packages in your configuration?

2. Did buildroot create a build directory for your packages in
output/build/<pkgname>-<version>?  If not, the package is somehow not
selected.

3. Does the build directory contain stamp files, esp. the one called
.stamp_target_intalled?  If not, it was never installed.

4. Does the build directory contain the compiled binaries?  If not, your
build commands are wrong so there are no binaries to install.

5. If you do a 'make <pkg>-dirclean; make <pkg>', what happens?  Do you see
some commands installing the binaries to the target?


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
