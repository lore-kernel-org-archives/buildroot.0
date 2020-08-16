From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun, 16 Aug 2020 12:13:29 +0200
Subject: [Buildroot] [PATCH v3 1/5]
 support/scripts/gen-bootlin-toolchains: add new script to support Bootlin
 toolchains
In-Reply-To: <20200814195235.986905-2-thomas.petazzoni@bootlin.com>
References: <20200814195235.986905-1-thomas.petazzoni@bootlin.com>
 <20200814195235.986905-2-thomas.petazzoni@bootlin.com>
Message-ID: <16887404-57d2-0809-7f45-9e90f4321539@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and all,

On 14/08/20 21:52, Thomas Petazzoni wrote:
> https://toolchains.bootlin.com/ has been providing for a few years a
> number of ready-to-use pre-built toolchains, for a wide range of
> architectures (which it turns out, are all built using Buildroot).
> 
> While toolchains.bootlin.com provides Buildroot config fragments to
> easily use those toolchains with Buildroot (see [0] for example), this
> is not visible anywhere. So instead, we would like to add support for
> these toolchains in Buildroot just like we have existing support for
> Linaro, ARM, Synopsys, etc. toolchains.

[--SNIP--]

> +def get_toolchains():
> +    toolchains = list()
> +    for arch, details in arches.items():
> +        print(arch)
> +        url = os.path.join(BASE_URL, arch, "available_toolchains")
> +        page = requests.get(url).text
> +        fnames = sorted(re.findall(r'<td><a href="(\w[^"]+)"', page))
> +        print(fnames)

This print(fnames) call should be removed. Besides this tiny remark,

Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>


Best regards,

Titouan
