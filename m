From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 23:44:16 +0200
Subject: [Buildroot] [next v2 5/7] testing/tests/download: add git hash
	tests
In-Reply-To: <20170826222056.6119-5-ricardo.martincoski@gmail.com>
References: <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
 <20170826222056.6119-5-ricardo.martincoski@gmail.com>
Message-ID: <d3d54a1a-73d6-eab2-9b54-721e124435bb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Darn, I was too quick with my Rev-by tag...

On 27-08-17 00:20, Ricardo Martincoski wrote:
[snip]
> diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
> new file mode 100644
> index 0000000000..2ad06fa47f
> --- /dev/null
> +++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# bad
> +#
> +################################################################################
> +
> +BAD_VERSION = 7446f8dab6cdb166aaf130aa88633dc627a4e8ad
> +# Get the git server port number from the test infra
> +GITREMOTE_PORT_NUMBER ?= 9418

 This is not OK, since the same variable is defined in multiple places. You can
just put it in the external.mk instead.

 Regards,
 Arnout

> +BAD_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
> +
> +$(eval $(generic-package))
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
