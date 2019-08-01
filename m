From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Aug 2019 12:43:12 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] libv4l: add an option for IR BPF based decoders
In-Reply-To: <20181109172648.10289-1-fontaine.fabrice@gmail.com>
References: <20181109172648.10289-1-fontaine.fabrice@gmail.com>
Message-ID: <0d7c03c9-feee-0f45-2fd2-355e15d0e606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Fabrice,

On 09/11/2018 18:26, Fabrice Fontaine wrote:
> Bump to version 1.61.1 added BPF based protocols support:
> https://git.linuxtv.org/v4l-utils.git/commit/?id=d6025b0e8c7f57b0f9390f987acc5eed57360d80
> 
> However, this dependency needs BPF support in kernel. On old kernels
> (before 3.18), __NR_BPF is not defined for all architectures.
> So retrieve upstream patch and add an option to enable BPF only if
> headers are above 3.18.
> 
> Also drop patch to add bpf_common.h on old kernels (not needed anymore)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/442de57cb76a7b38d71d690490faadc641036374

 This problem apparently went away with the bump to 1.16.2 (without needing to
give the --disable-bpf config argument) so I've marked this patch as Superseded.

 Please respin if you think it is still needed.

 Regards,
 Arnout
