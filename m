From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 23 Jan 2015 00:43:25 +0100
Subject: [Buildroot] [PATCH] infozip: fix compilation with
	LARGE_FILE_SUPPORT
In-Reply-To: <20150120174108.5a6ecd37@free-electrons.com>
References: <1421748962-838-1-git-send-email-richard.genoud@gmail.com>
 <20150120174108.5a6ecd37@free-electrons.com>
Message-ID: <54C18B1D.6030206@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Richard, Thomas,

Le 20/01/2015 17:41, Thomas Petazzoni a ?crit :
> Dear Richard Genoud,
> 
> On Tue, 20 Jan 2015 11:16:02 +0100, Richard Genoud wrote:
> 
>> +INFOZIP_CFLAGS = -I. -DUNIX
>> +
>> +ifeq ($(BR2_LARGEFILE),y)
>> +INFOZIP_CFLAGS += -DLARGE_FILE_SUPPORT
>> +endif
> 
> Things are not really clear: the INSTALL file from infozip says:
> 
>     This flag should be set automatically on Unix, Win32, and some
>     other ports.  Setting NO_LARGE_FILE_SUPPORT turns this flag off.
> 
> So according to this, it should not be necessary to set this flag
> explicitly. However, after a quick look at the unix/configure script, I
> haven't seen any logic doing this. Can you confirm?
> 
> Thanks,
> 
> Thomas
> 

Sorry, I made a mistake in commit cc4dedd9...

This week I updated from 2013.08 to 2014.11 and I had a runtime error with zip:
"zip warning : Not supported (uzoff_t not same size as zoff_t)"

I'm sending a series to fit this.

Best regards,
Romain Naour
