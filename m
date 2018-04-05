From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Apr 2018 08:05:21 +0200
Subject: [Buildroot] [PATCH 1/2] python-webpy: needs hashlib support in
 python
In-Reply-To: <9a7c746b-d237-7169-c121-f3091d152fbe@mind.be> (Arnout
 Vandecappelle's message of "Thu, 5 Apr 2018 00:55:43 +0200")
References: <20180404155132.17500-1-peter@korsgaard.com>
 <9a7c746b-d237-7169-c121-f3091d152fbe@mind.be>
Message-ID: <874lkqnq72.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 04-04-18 17:51, Peter Korsgaard wrote:
 >> webpy uses hashlib for session handling, so ensure it is available:
 >> 
 >> web/session.py:    import hashlib
 >> web/session.py:    sha1 = hashlib.sha1
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/python-webpy/Config.in | 1 +
 >> 1 file changed, 1 insertion(+)
 >> 
 >> diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
 >> index 12dbe61723..5f4df7832b 100644
 >> --- a/package/python-webpy/Config.in
 >> +++ b/package/python-webpy/Config.in
 >> @@ -1,6 +1,7 @@
 >> config BR2_PACKAGE_PYTHON_WEBPY
 >> bool "python-webpy"
 >> depends on BR2_PACKAGE_PYTHON
 >> +	select BR2_PACKAGE_PYTHON_HASHLIB

 >  # runtime ?

I argued about that as well, but given that it is a sub option of python
(so not something you can add to _DEPENDENCIES anyway), and
(host-)python is a build time dependency it isn't really black / white
and I decided to not add it.

-- 
Bye, Peter Korsgaard
