From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Apr 2021 09:28:17 +0200
Subject: [Buildroot] [PATCH] package/python3: security bump to version
 3.9.4
In-Reply-To: <20210405152954.28824-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 5 Apr 2021 17:29:54 +0200")
References: <20210405152954.28824-1-peter@korsgaard.com>
Message-ID: <87y2dvq3ce.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - bpo-42988: CVE-2021-3426: Remove the getfile feature of the pydoc module
 >   which could be abused to read arbitrary files on the disk (directory
 >   traversal vulnerability).  Moreover, even source code of Python modules
 >   can contain sensitive data like passwords.  Vulnerability reported by
 >   David Schw?rer.

 > - bpo-43285: ftplib no longer trusts the IP address value returned from the
 >   server in response to the PASV command by default.  This prevents a
 >   malicious FTP server from using the response to probe IPv4 address and
 >   port combinations on the client network.

 >   Code that requires the former vulnerable behavior may set a
 >   trust_server_pasv_ipv4_address attribute on their ftplib.FTP instances to
 >   True to re-enable it.

 > - bpo-43439: Add audit hooks for gc.get_objects(), gc.get_referrers() and
 >   gc.get_referents().  Patch by Pablo Galindo.

 > Note: 3.9.3 was recalled due to introducing unintentional ABI
 > incompatibility, and fixes re-released as 3.9.4:

 > https://www.python.org/downloads/release/python-394/

 > Add host-autoreconf-archive, as it is needed for autoreconf since:
 > https://github.com/python/cpython/commit/064bc07f241dceec2fc577cbf5c31fa6d63fe320

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
