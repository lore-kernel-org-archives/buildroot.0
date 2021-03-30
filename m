From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Mar 2021 08:18:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: security bump
 to version 1.26.4
In-Reply-To: <20210329203942.304916-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Mar 2021 22:39:42 +0200")
References: <20210329203942.304916-1-fontaine.fabrice@gmail.com>
Message-ID: <87wntpcgfh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-28363: The urllib3 library 1.26.x before 1.26.4 for Python
 > omits SSL certificate validation in some cases involving HTTPS to HTTPS
 > proxies. The initial connection to the HTTPS proxy (if an SSLContext
 > isn't given via proxy_config) doesn't verify the hostname of the
 > certificate. This means certificates for different servers that still
 > validate properly with the default urllib3 SSLContext will be silently
 > accepted.

 > https://github.com/urllib3/urllib3/blob/1.26.4/CHANGES.rst

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
