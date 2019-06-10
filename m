From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 20:43:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump to
 version 10.3.15
In-Reply-To: <20190610134749.4356-1-bluemrp9@gmail.com>
References: <20190610134749.4356-1-bluemrp9@gmail.com>
Message-ID: <d4a79f6c-d174-7836-b233-ae60c2c9f991@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 15:47, Ryan Coe wrote:
> Release notes:
> https://mariadb.com/kb/en/library/mariadb-10315-release-notes/
> 
> Changelog:
> https://mariadb.com/kb/en/mariadb-10315-changelog/

[snip]
> 
> diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
> index db24f7bb9b..857005695d 100644
> --- a/package/mariadb/mariadb.hash
> +++ b/package/mariadb/mariadb.hash
> @@ -1,8 +1,8 @@
> -# From https://downloads.mariadb.org/mariadb/10.3.13
> -md5 603ce42e35b9a688f2cca05275acb5cb  mariadb-10.3.13.tar.gz
> -sha1 08467885412184e99b835732913d445fd2c4b1b3  mariadb-10.3.13.tar.gz
> -sha256 b2aa857ef5b84f85a7ea60a1eac7b34c0ca5151c71a0d44ce2d7fb028d71459a  mariadb-10.3.13.tar.gz
> -sha512 3cbd93291aa43b235e5b81d953ea69fb32df54fb518f922f69b5485952f01fae693c77b0efac37f414ed7ff132d3b58f899812bdb7be8a5b344c3640e2c3a0dd  mariadb-10.3.13.tar.gz
> +# From https://downloads.mariadb.org/mariadb/10.3.15
> +md5 08edd8b5060a181e6dd3c6aac23218cd  mariadb-10.3.15.tar.gz
> +sha1 134f6a1ee6bf3048580eca945a51cb3c9bda7cbe  mariadb-10.3.15.tar.gz
> +sha256 27f391a54d544f93850d4edfb3ef1b4cf24f8e27e61e51727b0e7d31bb4d6968  mariadb-10.3.15.tar.gz
> +sha512 35332ac32cba27fef1b4ddd2209236853f4309756fd121fbdbd2b6be0651e817cedc80e276b89ccfa4bc76760811434fab45a4d380d0ebd500c7d9bd7377fe93  mariadb-10.3.15.tar.gz
>  
>  # Hash for license files
>  sha256 43f4b5b13cecbbdb04a180cbf6c2bd64237819d1a32165b7d475c1b392e6a8d1  README.md

 legal-info fails:

ERROR: README.md has wrong sha256 hash:
ERROR: expected: 43f4b5b13cecbbdb04a180cbf6c2bd64237819d1a32165b7d475c1b392e6a8d1
ERROR: got     : a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8

 Could you check what has changed in the README, update the hash, and explain
the changes in the commit message?

 Regards,
 Arnout

> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index 356dd29af3..cfb08eb664 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MARIADB_VERSION = 10.3.13
> +MARIADB_VERSION = 10.3.15
>  MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
>  MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
>  # Tarball no longer contains LGPL license text
> 
