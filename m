From: William Wagner <will_wagner@carallon.com>
Date: Tue, 02 Mar 2010 09:02:27 +0000
Subject: [Buildroot] X11R7.5 git branch
In-Reply-To: <20100302094355.58cb7de8@surf>
References: <4B8AB776.40204@gmail.com> <20100302094355.58cb7de8@surf>
Message-ID: <4B8CD423.1060403@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/03/2010 08:43, Thomas Petazzoni wrote:
> Hi Paulius,
>
> On Sun, 28 Feb 2010 20:35:34 +0200
> Paulius Zaleckas<paulius.zaleckas@gmail.com>  wrote:
>
>    
>> As we have discussed earlier I have put all my X11R7.5 work in:
>>
>> git://gitorious.org/takeme-buildroot/takeme-buildroot.git x11r75
>>
>> Should I post patch series to the list?
>>      
> For me, having your git tree was enough.
>
> Generally, it looks very good and I think it can be merged as is. I
> appreciate the removal of all obsolete packages.
>
> I have a few questions though :
>
>   *) On many packages, but not all, you added FOOBAR_LIBTOOL_PATCH=NO.
>      What has driven your choice of applying or not applying the libtool
>      patch ?
>    

This is the same problem I saw and posted about here 
http://lists.busybox.net/pipermail/buildroot/2010-February/032446.html. 
It looks like the package has a newer version of ltmain.sh (2.2.6). Not 
sure if it no longer needs the patch of if that version needs a 
different version of the patch. I found most xorg packages needed the 
change.

>   *) I imagine that all the patches you are dropping for the different
>      packages have been merged upstream and are no longer needed ?
>
>   *) I think the xf86-video-wsfb could just be removed. But this can be
>      done later, if you don't want to rebase all your patch set.
>    

I think there are a lot of drivers that could be dropped, most of the 
video drivers are for hardware that has not been made for years so could 
be removed or marked deprecated.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
