From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 10 Jun 2014 12:06:44 +0200
Subject: [Buildroot] Some files to be copied to root file systems such
 as openvpn keys, conf
In-Reply-To: <CAMm5YqpZ1dV02==G=ZHEc3NUFD5UHGrUq7yTEzLQODQh1YfetQ@mail.gmail.com>
References: <CAMm5YqqvikddPNUdaj9t6pPFJXqcmQkDR3qFHfi8Uot1wVHgPg@mail.gmail.com>
 <CAHXCMMJsvZUPqtFwtKC=ZgSiNmwJ0A3_MYn=Fn0hbgi9iiz8Zg@mail.gmail.com>
 <CAMm5YqotyZ9y6c3vFXME+rh860RiB1X0RUFE=10k40yrzbM+fg@mail.gmail.com>
 <CAMm5YqpZ1dV02==G=ZHEc3NUFD5UHGrUq7yTEzLQODQh1YfetQ@mail.gmail.com>
Message-ID: <CAHXCMM+8D+waazrj2S6sU=T5y=3JjGD6A_=veV-zk548_uO-Dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cem, all,

On Tue, Jun 10, 2014 at 11:53 AM, cem akpolat <akpolatcem@gmail.com> wrote:
> Hi Samuel,
>
> The way that you explained is quite logical, however, I want to ask at that
> point what is the main reason behind the creation of the "Root Overlay",
> because for all packages and files , it is clearly seen that your defined
> method will work. for instance I can easily create a package called
> "toBeInstalledToRootFs" and then put all of them under this folder along
> with an appropriate Makefile.

Unfortunately, you hit a limitation of the "Root Overlay": files are
copied, but permissions are not set.

AFAIK, there is no way to set permissions on files outside a package's
*.mk files :-(
However, a package can set permission on any target files, even on
files provided by another package.

Regards,

-- 
Samuel
