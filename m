From: Chris Robson <Chris.Robson@nrl.navy.mil>
Date: Tue, 12 Jan 2010 08:41:37 -0500
Subject: [Buildroot] Application package cross linked to package
 libraries problem
In-Reply-To: <20100112142157.7c4bcb36@surf>
References: <4B4C603A.70104@nrl.navy.mil>	<e4b6ec781001120358g3202f322qa8ae8c9408d8de40@mail.gmail.com>	<4B4C6C74.9040703@nrl.navy.mil>
	<20100112142157.7c4bcb36@surf>
Message-ID: <4B4C7C11.3080301@nrl.navy.mil>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thomas

Ah, yes, its the softlink that's missing aka.....

sofia-sip is installed into ....
$(STAGING_DIR)/usr/include/sofia-sip-[version number]
thus nua.h is located in:
$(STAGING_DIR)/usr/include/sofia-sip-[version number]/sofia-sip/nua.h
ergo what is need is:
$(STAGING_DIR)/usr/include/sofia-sip -> 
$(STAGING_DIR)/usr/include/sofia-sip-[version number]

Is there an example how to do this?  (right now its manually coded to 
get past this)

thanks....Chris

On 01/12/2010 08:21 AM, Thomas Petazzoni wrote:
> On Tue, 12 Jan 2010 07:35:00 -0500
> Chris Robson<Chris.Robson@nrl.navy.mil>  wrote:
>
>    
>> build-juniper-commandline.c:8:27: error: sofia-sip/nua.h: No such
>> file or directory
>>      
> Looks like the sofia-sip headers haven't been installed into
> $(STAGING_DIR)/usr/include.
>
> The issue is likely to be in the sofia-sip.mk file rather than in your
> application .mk.
>
> Thomas
>    
