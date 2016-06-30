From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Wed, 29 Jun 2016 22:08:56 -0300 (BRT)
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
In-Reply-To: <CAAEAJfAjU1Rgz1hzbyOjDErsQ3L38suBKxh74n6+eNNPUThqdw@mail.gmail.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <20160629155233.510c456e@free-electrons.com>
 <CAHfJR7h01DTkHetP0W196NbmeHCNZZjw6Ju-D9uP3pA6+A1gNw@mail.gmail.com>
 <20160629161137.5b5a13b3@free-electrons.com>
 <CAHfJR7iZpPnpVB0NqQPCEvYU7myCsdW2x=m5aoi1KGZk0p_MTg@mail.gmail.com>
 <20160629164336.67a86168@free-electrons.com>
 <CAAEAJfAjU1Rgz1hzbyOjDErsQ3L38suBKxh74n6+eNNPUThqdw@mail.gmail.com>
Message-ID: <416890019.7098715.1467248936471.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



----- Mensagem original -----
> De: "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>
> Para: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Cc: "buildroot" <buildroot@buildroot.org>
> Enviadas: Quarta-feira, 29 de junho de 2016 18:53:26
> Assunto: Re: [Buildroot] [PATCH 00/24] Drop unused host packages

> On 29 June 2016 at 11:43, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> [..]
>>
>>  */ Host packages that are not used by other packages in Buildroot, but
>>     might be used by private, company/project-specific packages. I
>>     don't like this situation, because there is really no way these
>>     host packages will ever be built/tested. But I'm not sure what to
>>     do about these: adding an entry in menuconfig is a bit weird since
>>     they are not really needed for anything else but a build dependency.
>>
> 
> I guess we could argue that if company/project is willing to maintain some
> private package(s), then they are willing to maintain its dependencies,
> incluing host package(s) and carry the whole bunch out of tree.
> --
> Ezequiel Garc?a, VanguardiaSur
> www.vanguardiasur.com.ar
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I can confirm some of the host packages removed with the patch series are used to build private packages, in private buildroot trees.

Of course, we try to contribute as much as possible, and it seems to me that keep this packages in the tree is good for us, because our private tree based on upstream buildroot tree have no more than 10 patches. Everytime there is an opportunity to send one of this patches to buildroot upstream, we have one less package to maintain internally, and this is good for us and for the project.

We could think of a stronger politics of ownership for these packages, instead of removing them from the upstream tree.

Some host packages, like perl-file-util, would be a little harder to maintain in our buildroot-tree.

-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
