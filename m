From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Sep 2014 22:59:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: bump to version 0.8.1
In-Reply-To: <1411505326-11833-1-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 23 Sep 2014 22:48:46 +0200")
References: <1411505326-11833-1-git-send-email-jkrause@posteo.de>
Message-ID: <87y4t7xvpa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > Bumping to version 0.8.1 requires a change of the uclibc patch.
 > Signed-off-by: J?rg Krause <jkrause@posteo.de>
 > ---
 >  package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch | 59 ++++++++++++++---------
 >  package/upmpdcli/upmpdcli.mk                      |  2 +-
 >  2 files changed, 36 insertions(+), 25 deletions(-)

Sorry, it doesn't seem to build here with uClibc (missing header?):

libtool: compile:  /home/peko/source/buildroot/output/host/usr/bin/arm-linux-g++ -DHAVE_CONFIG_H -I. -I./libupnpp -DDEBUG -g -Wall -DDATADIR=\"/usr/share/upmpdcli\" -DCONFIGDIR=\"/etc\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -std=c++0x -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -c libupnpp/control/description.cxx -o libupnpp/control/description.o >/dev/null 2>&1
libupnpp/control/avtransport.cxx: In member function 'void UPnPClient::AVTransport::evtCallback(const std::unordered_map<std::basic_string<char>, std::basic_string<char> >&)':
libupnpp/control/avtransport.cxx:159:63: error: 'atoi' was not declared in this scope
Makefile:800: recipe for target 'libupnpp/control/avtransport.lo' failed
make[1]: *** [libupnpp/control/avtransport.lo] Error 1

-- 
Bye, Peter Korsgaard
