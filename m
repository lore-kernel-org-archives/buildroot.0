From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 23 Apr 2019 02:28:30 +0300
Subject: [Buildroot] [RFC 1/1] br2-external: Alow to include toolchain
 from external tree
In-Reply-To: <20190420205404.GC21166@scaer>
References: <20190417204630.18746-1-vadim4j@gmail.com>
 <a37f9f50-381a-cdfb-4d78-bd78bbdd9f4c@mind.be>
 <20190418145344.GA21166@scaer>
 <20190419030101.cktcloq4rfqyw3mt@vkochan-ThinkPad-T470p>
 <bc9c8aa1-9c56-7c86-9b3f-2cd66a91f796@mind.be>
 <20190420205404.GC21166@scaer>
Message-ID: <20190422232830.akhqyzxuaycl3hdr@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Arnout, All

On Sat, Apr 20, 2019 at 10:54:04PM +0200, Yann E. MORIN wrote:
> Vadim, Arnout, All,
> 
> Here's my take on the topic (still WIP, but mostly there, needs commit
> log):
> 
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/br2-ext-toolchain
> 

So, it looks like for each "special" package like openssl or jpeg it
will be needed such additional support from buildroot ( I mean
additional support of new "provides/xxx" from the buildroot core ). I am
really think that Kconfig should be tuned for buildroot for such cases.

For example if to allow apply the last default value for the config
option by kconfig parser, then it makes possible to provide easy replacements of
existing default values (defined by buildroot) from the br2-external, like setting own
"_PROVIDES" or other options.

Or another case like to able extend existin choice from br2-external with new
option, for example:

	choice in buildroot:
	-------------------

	choice "external-toolchain"

	source "..."

	...
	endchoice

	choice in br2-external:
	----------------------

	choice "external-toolchain"
	source "custom-path.in"
	endchoice


in the above's case the "choice" from br2-external will be appended to
the existing one from buildroot.

Yes, you pointed that it is better to have kconfig aligned with Linux
kernel's one. But for me it looks like the kernel does not have such cases like
buildroot.

I am sorry that I am still boring you with these kconfig things, just
can't keep it in my head)

Regards,
Vadim Kochan
