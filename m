From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:53:41 +0200
Subject: [Buildroot] [PATCH] python-django: security bump to version
	1.10.7
In-Reply-To: <20170427073718.28757-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 27 Apr 2017 09:37:18 +0200")
References: <20170427073718.28757-1-peter@korsgaard.com>
Message-ID: <878tmkhewa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > Since 1.10.3:

 > CVE-2016-9013 - User with hardcoded password created when running tests on
 > Oracle

 > Marti Raudsepp reported that a user with a hardcoded password is created
 > when running tests with an Oracle database.

 > CVE-2016-9014 - DNS rebinding vulnerability when DEBUG=True

 > Aymeric Augustin discovered that Django does not properly validate the Host
 > header against settings.ALLOWED_HOSTS when the debug setting is enabled.  A
 > remote attacker can take advantage of this flaw to perform DNS rebinding
 > attacks.

 > Since 1.10.7:

 > CVE-2017-7233 - Open redirect and possible XSS attack via user-supplied
 > numeric redirect URLs

 > It was discovered that is_safe_url() does not properly handle certain
 > numeric URLs as safe.  A remote attacker can take advantage of this flaw to
 > perform XSS attacks or to use a Django server as an open redirect.

 > CVE-2017-7234 - Open redirect vulnerability in django.views.static.serve()

 > Phithon from Chaitin Tech discovered an open redirect vulnerability in the
 > django.views.static.serve() view.  Note that this view is not intended for
 > production use.

 > Cc: Oli Vogt <oli.vogt.pub01@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
