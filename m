From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 21 Oct 2018 20:47:05 +0300
Subject: [Buildroot] How can I compile a module into the kernel?
In-Reply-To: <20181021193349.41779f48@windsurf>
References: <CAF_dkJAn7NgNfn5d0wQDnGF7UoCuFoUZvnpvvYDgWoA7RpV4Ag@mail.gmail.com>
 <20181021095548.41d5f0b9@windsurf.lan>
 <CAF_dkJD1hZ0+8=+j64dMffDULsfG1DufDU8po4zm8VxAfdh0dA@mail.gmail.com>
 <20181021193349.41779f48@windsurf>
Message-ID: <87in1v8a5i.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Patrick,

Thomas Petazzoni writes:
> On Sun, 21 Oct 2018 13:20:58 -0400, Patrick Doyle wrote:
>> Is it possible to permanently disable loadable modules from user space
>> at runtime?  Or to only load signed modules?  Or do I need to look
>> more carefully at selinux?
>
> Yes, you can lock to only load signed modules, and I think you can also
> lock to no longer load any modules, i.e you can load a few modules at
> boot time, and then ask the kernel to no longer load any other module.

See the 'modules_disabled' sysctl. It's documented in
Documentation/sysctl/kernel.txt.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
