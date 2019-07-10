From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jul 2019 00:03:55 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/qt5webengine: sort license
 hash list by path
In-Reply-To: <20190710173645.15459-1-ps.report@gmx.net>
References: <20190710173645.15459-1-ps.report@gmx.net>
Message-ID: <dbe7e509-c286-d472-9494-e6f3610c5c1e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/07/2019 19:36, Peter Seiderer wrote:
> +# for i in $(find src/3rdparty/ -type f \( -iname 'license*' -o -iname 'copying*' -o -name 'APPLE_LICENSE' -o -name 'Copyright' -o -path '*/license_texts/*' -o -path '*/licenses/*' \) -a -not -name '*.cc' -not -name '*.py' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before') ; do echo -n "sha256 " ; sha256sum $i ; done | sort --key=3

 It would have been more logical to sort the output of find instead of the final
result, i.e.:

for i in $(find ... | sort); do ...; done

but it doesn't matter much, so applied to master, thanks.

 Regards,
 Arnout
