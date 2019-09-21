From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 16:00:39 +0200
Subject: [Buildroot] [PATCH 0/9] Fix hash issues during make legal-info
In-Reply-To: <20190920124242.22479-1-nicolas.carrier@orolia.com>
References: <20190920124242.22479-1-nicolas.carrier@orolia.com>
Message-ID: <0157abfc-f3aa-83cc-b56c-95d537155731@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/09/2019 14:43, Nicolas Carrier wrote:
> Patch series fixing all the ERRORs which I encountered running the make-legal
> target for one of our products, by adding the relevant sha256 hashes.
> 
> Nicolas Carrier (9):
>   package/kmod: add missing hash for LICENSE file

 This is actually COPYING rather than LICENSE.

 With that fixed, applied series to master, thanks!

 Regards,
 Arnout

>   package/nss-mdns: add missing hash for LICENSE file
>   package/nss-pam-ldapd: add missing hash for COPYING file
>   package/pppd: add missing file hashes
>   package/python-pyasn: add missing hash for LICENSE.txt file
>   package/python-pyzmq: add missing hashes for COPYING.(BSD|LESSER)
>     files
>   package/rsyslog: add missing hashes for COPYING.* files
>   package/tinyxml: add missing hash for README file
>   package/xinetd: add missing hash for COPYRIGHT file
> 
>  package/kmod/kmod.hash                   | 1 +
>  package/nss-mdns/nss-mdns.hash           | 1 +
>  package/nss-pam-ldapd/nss-pam-ldapd.hash | 1 +
>  package/pppd/pppd.hash                   | 7 +++++++
>  package/python-pyasn/python-pyasn.hash   | 3 +++
>  package/python-pyzmq/python-pyzmq.hash   | 4 ++++
>  package/rsyslog/rsyslog.hash             | 5 +++++
>  package/tinyxml/tinyxml.hash             | 1 +
>  package/xinetd/xinetd.hash               | 1 +
>  9 files changed, 24 insertions(+)
> 
