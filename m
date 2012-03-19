From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 19 Mar 2012 10:19:02 +0100
Subject: [Buildroot] [PATCH] netsnmp: add option to enable debugging code
In-Reply-To: <87pqc9mym5.fsf@macbook.be.48ers.dk>
References: <1331845467-5100-1-git-send-email-luca@lucaceresoli.net>
 <201203181837.30186.arnout@mind.be> <87pqc9mym5.fsf@macbook.be.48ers.dk>
Message-ID: <4F66FA06.1070205@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle<arnout@mind.be>  writes:
>   Arnout>  On Thursday 15 March 2012 22:04:27 Luca Ceresoli wrote:
>   >>  +ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
>   >>  +       NETSNMP_CONF_OPT += --disable-debugging
>   >>  +endif
>
>   Arnout>   Peter, is it correct that you prefer to have both the positive
>   Arnout>  and the negative option in such a situation?  I.e.
>
>   Arnout>  ifeq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
>   Arnout>         NETSNMP_CONF_OPT += --enable-debugging
>   Arnout>  else
>   Arnout>         NETSNMP_CONF_OPT += --disable-debugging
>   Arnout>  endif
>
> I don't feel strongly about it, but the 2nd approach means you don't
> need to look at configure.ac to check if it defaults to --enable (and it
> won't break if the default is ever changed).
>

Arnout's version is definitely more robust, although less concise and more
boring to write.

But there are many other examples in the current Buildroot code without the
else part. So I think we should have a guideline to follow coherently.

It would be great to have a macro to generate all of this boilerplate code,
both robust and concise. I would love to be able to write something like:

   $(call ac-arg-endisable,BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING,debugging)

It's even on my TODO list, which is the first step to many great things!

Luca
