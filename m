From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 22 Apr 2014 10:49:41 +0200
Subject: [Buildroot] OpenCV compilation Error
In-Reply-To: <ca096bb26ec0bce2562265ecaab7e80f@paravisioner.com>
References: <ca096bb26ec0bce2562265ecaab7e80f@paravisioner.com>
Message-ID: <CAHXCMMJR3q-butnbGv=Ef5eoocKG2tSvMaCXSbhXm25grw+MSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Apr 22, 2014 at 10:30 AM, Parsa Panahi
<panahi.parsa@paravisioner.com> wrote:
> Hi
>
> I checked opencv to be included in my kernel but When I make the buildroot
> it gives the following error for the opencv package.
>
>
>
> It seems it didn't find the gcc/cmake cannot compile the package. what's
> wrong and what should I do ?
>

It seems the toolchainfile.cmake is wrongly generated.
Could you share your .config file?

Also could you tell us more about the step you've done to setup your
configuration (e.g.: "make blabla_defconfig", then: "make menuconfig"
and change this and that toolchain options)?


As a quick fix, you can try the following:
rm /home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/share/buildroot/toolchainfile.cmake
then, rerun the build

Regards,

--
Samuel
