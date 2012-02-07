From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Feb 2012 09:59:01 +0100
Subject: [Buildroot] [PATCH] manual: update download helper information
In-Reply-To: <a19551b34f1bdd74cc65.1328560868@beantl019720> (Thomas De
 Schampheleire's message of "Mon, 06 Feb 2012 21:41:08 +0100")
References: <a19551b34f1bdd74cc65.1328560868@beantl019720>
Message-ID: <87haz3t3xm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Signed-off-by: Thomas De Schampheleire
 Thomas> <thomas.de.schampheleire@gmail.com>

Thanks, committed.

 Thomas> +  Examples: +
 Thomas> +    +LIBFOO_VERSION = 0.1.2+ +
 Thomas> +    +LIBFOO_VERSION = cb9d6aa9429e838f0e54faa3d455bcbab5eef057+ +
 Thomas> +    +LIBFOO_VERSION = stable+

Not your fault, but a2x doesn't seem to add line breaks here. I don't
particulary know docbook, but looking a bit closer, it seems like you
need to add something like:

<xsl:template match="processing-instruction('asciidoc-br')">
  <xsl:text disable-output-escaping="yes"><![CDATA[<br/>]]></xsl:text>
</xsl:template>

To /etc/asciidoc/docbook-xsl/{xhtml,text}.xsl

I don't quite understand why upstream isn't doing that though.

-- 
Bye, Peter Korsgaard
