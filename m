From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Thu, 29 Sep 2016 13:11:04 -0300 (BRT)
Subject: [Buildroot] [RCF 1/2] support: enforce '--binary' when
	applying	patches
In-Reply-To: <20160929145701.27116-1-james.knight@rockwellcollins.com>
References: <20160929145701.27116-1-james.knight@rockwellcollins.com>
Message-ID: <764549583.350082.1475165464533.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,

This change can have issues with old distros, see below.
Currently buildroot does not enforce a minimal version of 'patch'.

----- Original Message -----
> From: "James Knight" <james.knight@rockwellcollins.com>
> To: buildroot at busybox.net
> Cc: "James Knight" <james.knight@rockwellcollins.com>
> Sent: Thursday, September 29, 2016 11:57:00 AM
> Subject: [Buildroot] [RCF 1/2] support: enforce '--binary' when applying	patches

> The following commit enforces the patch operation to "disable the
> heuristic for transforming CRLF line endings into LF line endings" [1].
[snip]

So I think you need a version of the tool 'patch' that contains [3]
that was merged in patch v2.6
RHEL5 and RHEL4 use patch v2.5.4.

> [1]: http://git.savannah.gnu.org/cgit/patch.git/tree/patch.man#n306
> [2]: https://www.gnu.org/software/diffutils/manual/html_node/Binary.html
[snip]

[3] http://git.savannah.gnu.org/cgit/patch.git/commit/?id=b7687446d1e7673a39fd66bc6043f4a78961f675

Regards,
Ricardo Martincoski
