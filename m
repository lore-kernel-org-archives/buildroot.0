From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jul 2020 17:09:23 +0200
Subject: [Buildroot] [git commit] package/python-django: security bump
 to version 3.0.7
In-Reply-To: <20200604204814.52A15839D2@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 4 Jun 2020 22:48:29 +0200")
References: <20200604204814.52A15839D2@busybox.osuosl.org>
Message-ID: <87y2n6xqho.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=36d78abceb79ad8b8ea73054cd2e6fcfcc835c4f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues:

 > - CVE-2020-13254: Potential data leakage via malformed memcached keys

 >   In cases where a memcached backend does not perform key validation,
 >   passing malformed cache keys could result in a key collision, and
 >   potential data leakage.  In order to avoid this vulnerability, key
 >   validation is added to the memcached cache backends.

 > - CVE-2020-13596: Possible XSS via admin ForeignKeyRawIdWidget

 >   Query parameters for the admin ForeignKeyRawIdWidget were not properly URL
 >   encoded, posing an XSS attack vector.  ForeignKeyRawIdWidget now ensures
 >   query parameters are correctly URL encoded.

 > For details, see the announcement:
 > https://docs.djangoproject.com/en/dev/releases/3.0.7/

 > Additionally, 3.0.5..3.0.7 contains a number of non-security related
 > bugfixes.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
