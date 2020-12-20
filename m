From: Qais Yousef <qais.yousef@arm.com>
Date: Sun, 20 Dec 2020 02:07:53 +0000
Subject: [Buildroot] [PATCHv5 3/5] package/libbpf: new package
In-Reply-To: <20201206173537.1397691-3-romain.naour@gmail.com>
References: <20201206173537.1397691-1-romain.naour@gmail.com>
 <20201206173537.1397691-3-romain.naour@gmail.com>
Message-ID: <20201220020753.4w4z5nw5qc6mgd63@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/06/20 18:35, Romain Naour wrote:
> A mirror of bpf-next linux tree bpf-next/tools/lib/bpf
> directory plus its supporting header files. The version
> of the package reflects the version of ABI.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Qais Yousef <qais.yousef@arm.com>
> ---

I admit, I'm not sure how to use this on its own. It did compile fine for me
though for arm64.

Is it just a library that is required to build bpf apps or there's more to it?

I think bpftrace dependency on it is not right by the way. BCC has its own copy
of libbpf and bpftrace already depends on that.

> I'm not sure if updating the bpf.h provided by the toolchain linux-headers
> is the right things to do.

If it needs linux-header 5.9, shouldn't it depend on that then?

Thanks

--
Qais Yousef
