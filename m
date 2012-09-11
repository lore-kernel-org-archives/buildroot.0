From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 11 Sep 2012 10:44:03 -0400
Subject: [Buildroot] [PATCH 2/4] Make Berkeley DB a dependency of
 linux-pam and make sure it is selected
In-Reply-To: <20120911163255.07c42a02@skate>
References: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
 <1347078066-25257-2-git-send-email-golubovsky@gmail.com>
 <20120911163255.07c42a02@skate>
Message-ID: <CADiAo4Jn3mdhvTOvDUria1XBnLvOCO_pAMWScdtTZhS67P4oxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Sep 11, 2012 at 10:32 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Sat,  8 Sep 2012 00:21:04 -0400,
> Dmitry <golubovsky@gmail.com> a ?crit :
>
>> -LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) flex
>> +LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) flex berkeleydb
>
> Looking at the code, the dependency indeed looks necessary. But isn't
> it possible to rework a bit linux-pam to make this dependency optional
> (and then submit this upstream)? Of course, if you don't care about
> making this dependency optional, then just keep it as it is.

I don't think such change in linux-pam is really needed. I'd keep it
here given the fix is trivial, and BerkeleyDB is not a huge library.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
