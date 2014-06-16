From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Jun 2014 07:17:54 +0200
Subject: [Buildroot] [PATCH 5 of 7 v3] toolchain-external: change
 version from 'undefined' to 'virtual'
In-Reply-To: <CAAXf6LX4zN1bYaxdskq9Evc5uT2Rw2ip-U7Dqf78bOOXiQgf4A@mail.gmail.com>
References: <patchbomb.1402085576@localhost>
 <640c5d9c5ac14d442207.1402085581@localhost>
 <20140607105728.469dd87d@free-electrons.com>
 <CAAXf6LX4nfHkyBe_G3eQSBTHr67SWb37TFEOL=0q+vZ1DMmdtA@mail.gmail.com>
 <20140608181033.29a00966@free-electrons.com>
 <CAAXf6LX4zN1bYaxdskq9Evc5uT2Rw2ip-U7Dqf78bOOXiQgf4A@mail.gmail.com>
Message-ID: <539E7E02.307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/08/14 19:23, Thomas De Schampheleire wrote:
[snip]
> I don't think that the MESSAGE solution adds a lot of complexity: the
> current definition is:
> MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION)
> $(1)$(TERM_RESET)"
> and this would become something like:
> MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME)
> $($(PKG)_EXTRA_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"

 Small fix: one of the spaces around $(PKG)_EXTRA_NAME should be removed.
Otherwise we have two spaces in the usual case. The extra name should then be
defined with an embedded space:

TOOLCHAIN_EXTERNAL_EXTRA_NAME = Sourcery$(space)


 Regards,
 Arnout

> 
> where FOO_EXTRA_NAME is a new variabel (name to be discussed) that can
> be set by any package (not only toolchain-external) if appropriate.
> This variable is default empty.
> 
> This is not too complex, right?
> 
> In any case, I suggest we drop this patch from the series for now.
> 
> Best regards,
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
