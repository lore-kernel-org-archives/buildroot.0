From: Julien Floret <julien.floret@6wind.com>
Date: Thu, 30 Jun 2016 15:01:04 +0200
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
In-Reply-To: <CAAEAJfAjU1Rgz1hzbyOjDErsQ3L38suBKxh74n6+eNNPUThqdw@mail.gmail.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <20160629155233.510c456e@free-electrons.com>
 <CAHfJR7h01DTkHetP0W196NbmeHCNZZjw6Ju-D9uP3pA6+A1gNw@mail.gmail.com>
 <20160629161137.5b5a13b3@free-electrons.com>
 <CAHfJR7iZpPnpVB0NqQPCEvYU7myCsdW2x=m5aoi1KGZk0p_MTg@mail.gmail.com>
 <20160629164336.67a86168@free-electrons.com>
 <CAAEAJfAjU1Rgz1hzbyOjDErsQ3L38suBKxh74n6+eNNPUThqdw@mail.gmail.com>
Message-ID: <CAHfJR7hEoGKgCjiY-5FP2PsyGPTwj=-EBNbk5Fc_E8kHg7Fn5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-06-29 23:53 GMT+02:00 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>:
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

Then maybe the best approach would be to add Kconfig options for
all host packages, similarly to target packages - blind options for build
dependencies that get selected automatically by other packages, and
explicit options for host packages that are unreachable in upstream
buildroot - to allow testing their build and keep track of them?

Besides, having Kconfig options for all host packages would open the way
to including only the .mk files of selected packages, to speed up the
makefile parsing.
Maybe it could be handy for other things, too?
