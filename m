From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 16:34:34 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-django: security bump to
 version 3.2.2
In-Reply-To: <20210506212540.17671-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 6 May 2021 23:25:40 +0200")
References: <20210506212540.17671-1-peter@korsgaard.com>
 <20210506212540.17671-2-peter@korsgaard.com>
Message-ID: <87zgx5wayt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Django 3.0.x is EOL, so move to 3.2.x which is the new LTS release.  For
 > details of the changes and update instructions, see the announcement:

 > https://www.djangoproject.com/weblog/2021/apr/06/django-32-released/

 > Fixes the following security issues:

 > - CVE-2021-30459 - SQL Injection via Select, Explain and Analyze forms of
 >   the SQLPanel for Django Debug Toolbar >= 0.10.0

 >   With Django Debug Toolbar 0.10.0 and above, attackers are able to execute
 >   SQL by changing the raw_sql input of the SQL explain, analyze or select
 >   forms and submitting the form.  This is a high severity issue for anyone
 >   using the toolbar in a production environment.  Generally the Django Debug
 >   Toolbar team only maintains the latest version of django-debug-toolbar,
 >   but an exception was made because of the high severity of this issue.

 >   The GitHub Security Advisory can be found here:
 >   https://github.com/jazzband/django-debug-toolbar/security/advisories/GHSA-pghf-347x-c2gj

 > - CVE-2021-31542: Potential directory-traversal via uploaded files

 >   MultiPartParser, UploadedFile, and FieldFile allowed directory-traversal
 >   via uploaded files with suitably crafted file names.

 >   In order to mitigate this risk, stricter basename and path sanitation is
 >   now applied.  Specifically, empty file names and paths with dot segments
 >   will be rejected.

 >   This issue has low severity, according to the Django security policy.

 > - CVE-2021-32052: Header injection possibility since URLValidator accepted
 >   newlines in input on Python 3.9.5+

 >   On Python 3.9.5+, URLValidator didn't prohibit newlines and tabs.  If you
 >   used values with newlines in HTTP response, you could suffer from header
 >   injection attacks.  Django itself wasn't vulnerable because HttpResponse
 >   prohibits newlines in HTTP headers.

 >   Moreover, the URLField form field which uses URLValidator silently removes
 >   newlines and tabs on Python 3.9.5+, so the possibility of newlines
 >   entering your data only existed if you are using this validator outside of
 >   the form fields.

 >   This issue was introduced by the bpo-43882 fix.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
