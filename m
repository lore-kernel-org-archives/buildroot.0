From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 11:42:13 +0200
Subject: [Buildroot] [PATCH] git-download: Fix downloading of specific
 revisions from github.
References: <20180626093617.13034-1-neumann@teufel.de>
 <16e96d96-9301-46b7-16a2-d745507da71d@mind.be>
Message-ID: <lkqn4fx8c7.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 26 Jun 2018 23:38:18 +0200 schrieb Arnout Vandecappelle:

> On 26-06-18 11:36, Sven Neumann wrote:
>> From: Oliver Tappe <zooey@hirschkaefer.de>
>> 
>> Github has recently dropped support for the archive-URLs that we used
>> to use.
> 
>  Could you explain what exactly fails? I tried existing packages and
>  your new
> wampcc with the old pattern, and it just works (same hash).

Hi,

I did not test the patch but a problem when downloading from github does 
exist, for example:

$ LC_ALL=C make libsrtp
>>> libsrtp v1.5.4 Downloading

[...]

--2018-08-19 11:37:59--  https://github.com/cisco/libsrtp/archive/v1.5.4/
libsrtp-v1.5.4.tar.gz
Resolving github.com (github.com)... 192.30.253.113, 192.30.253.112
Connecting to github.com (github.com)|192.30.253.113|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/cisco/libsrtp/tar.gz/v1.5.4/libsrtp-
v1.5.4 [following]
--2018-08-19 11:37:59--  https://codeload.github.com/cisco/libsrtp/tar.gz/
v1.5.4/libsrtp-v1.5.4
Resolving codeload.github.com (codeload.github.com)... 192.30.253.120, 
192.30.253.121
Connecting to codeload.github.com (codeload.github.com)|192.30.253.120|:
443... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-08-19 11:38:00 ERROR 404: Not Found.

--2018-08-19 11:38:00--  http://sources.buildroot.net/libsrtp/libsrtp-
v1.5.4.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.25.210.19, 
104.25.211.19, 2400:cb00:2048:1::6819:d313, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|
104.25.210.19|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1646184 (1.6M) [application/x-gtar-compressed]

[...]

libsrtp-v1.5.4.tar.gz: OK (sha256: 
56a7b521c25134f48faff26b0b1e3d4378a14986a2d3d7bc6fefb48987304ff0)

Regards, Bernd
