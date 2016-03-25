From: David Picard <davepiq@yahoo.fr>
Date: Fri, 25 Mar 2016 15:46:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/qwt : prepared package for
 other versions of Qt.
In-Reply-To: <20160325104839.20bcbe13@free-electrons.com>
References: <1458850791-4205-1-git-send-email-davepiq@yahoo.fr>
 <20160325104839.20bcbe13@free-electrons.com>
Message-ID: <56F54F63.1040001@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I get an error like :
make[1]: *** no rule to make target "qt5", needed by 
"<BASEDIR>/build/qwt-6.1.2/.stamp_configured". Stopping.

Wouldn't it be because of line 15 in package/qwt/qwt.mk ?
https://git.buildroot.net/buildroot/tree/package/qwt/qwt.mk?id=a976ee0dc834c56e67e1c832ded00ce23b5ccdb0

I changed it from :
QWT_DEPENDENCIES += qt5
to :
QWT_DEPENDENCIES += qt5base
and then I could build on. It seems like "qt5" is not a valid target 
name. By the way, where can you find what are the valid values ?




Le 25/03/2016 10:48, Thomas Petazzoni a ?crit :
> Hello,
>
> On Thu, 24 Mar 2016 21:19:50 +0100, David Picard wrote:
>> Reformatted the package configuration to make it more generic. It will thus be
>> easier to handle more than one version of Qt. Indeed, multiple versions of Qt
>> are compatible with the current Qwt. Dropped comment, considered uninformative.
>>
>> Signed-off-by: David Picard <davepiq@yahoo.fr>
>> ---
>>   package/qwt/Config.in | 10 +++-------
>>   package/qwt/qwt.mk    |  5 ++++-
>>   2 files changed, 7 insertions(+), 8 deletions(-)
>
> I've tweaked the commit log to explain a bit more that we are switching
> to use "select" rather than "depends on" for the Qt sub-options, and
> applied. Thanks!
>
> Thomas
>
