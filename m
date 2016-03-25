From: David Picard <davepiq@yahoo.fr>
Date: Fri, 25 Mar 2016 17:16:36 +0100
Subject: [Buildroot] [PATCH 1/2] package/qwt : prepared package for
 other versions of Qt.
In-Reply-To: <20160325163033.260a4d11@free-electrons.com>
References: <1458850791-4205-1-git-send-email-davepiq@yahoo.fr>
 <20160325104839.20bcbe13@free-electrons.com> <56F54F63.1040001@yahoo.fr>
 <20160325163033.260a4d11@free-electrons.com>
Message-ID: <56F56464.8050204@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I saw you merged the patches into the master branch. So should I make a 
new patch based on the current master, or issue a new version of the 2 
previous patches ?

David.

Le 25/03/2016 16:30, Thomas Petazzoni a ?crit :
> Hello,
>
> On Fri, 25 Mar 2016 15:46:59 +0100, David Picard wrote:
>
>> I get an error like :
>> make[1]: *** no rule to make target "qt5", needed by
>> "<BASEDIR>/build/qwt-6.1.2/.stamp_configured". Stopping.
>>
>> Wouldn't it be because of line 15 in package/qwt/qwt.mk ?
>> https://git.buildroot.net/buildroot/tree/package/qwt/qwt.mk?id=a976ee0dc834c56e67e1c832ded00ce23b5ccdb0
>>
>> I changed it from :
>> QWT_DEPENDENCIES += qt5
>> to :
>> QWT_DEPENDENCIES += qt5base
>
> Correct. Can you send a new patch to fix this?
>
>> and then I could build on. It seems like "qt5" is not a valid target
>> name. By the way, where can you find what are the valid values ?
>
> The possible values are the list of all packages in Buildroot. Whenever
> you have a .mk file that calls one of the generic-package,
> autotools-package, *-package macro, then there is a make target with
> the same name.
>
> Best regards,
>
> Thomas
>
