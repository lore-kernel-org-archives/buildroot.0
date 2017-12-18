From: Ignacy =?iso-8859-2?Q?Gaw=EAdzki?= <ignacy.gawedzki@green-communications.fr>
Date: Mon, 18 Dec 2017 23:58:50 +0100
Subject: [Buildroot] [PATCH 0/1] nginx: Harden patches for using pkg-config.
Message-ID: <20171218225850.umfpvcawd4dg5nt6@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I stumbled upon two patches for nginx in which pkg-config is to be
used to determine which additional directories a particular module
needs includes to be searched in.  Simply removing any occurrence of
"-I" from the output is not the right thing to do.

As I have no idea where these patches come from, I simply propose to
patch them directly, leaving everything else unchanged.

Cheers,

Ignacy

Ignacy Gaw?dzki (1):
  nginx: Harden patches for using pkg-config.

 package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch | 5 +++--
 package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.14.1
