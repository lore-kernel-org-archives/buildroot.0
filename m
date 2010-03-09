From: Damien Borie <dbe@terawatt.fr>
Date: Tue, 09 Mar 2010 15:10:30 +0100
Subject: [Buildroot] Compilation error of Buildroot with X server
In-Reply-To: <4B9652A7.1080103@terawatt.fr>
References: <4B9124F4.40206@terawatt.fr> <20100307112147.55145b25@surf>
	<4B9652A7.1080103@terawatt.fr>
Message-ID: <4B9656D6.3070202@terawatt.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oups, sorry, here is the correct .config.

Damien.

Damien Borie a ?crit :
> OK. So I have restarted everything with the new buildroot version. I 
> have started configuration from the beginning, but based on my old 
> .config. Compilation has been long (QT...). Now I got a cleaner project!
> But finally, I have the same error exactly.
> I forgot a detail : I use a external toolchain made with Crosstool, 
> and, as it was working for the precedent target (and it's the same 
> target), I used the same toolchain.
> I join the .config. For all X11 parameters, I kept default.
>
> Thanks.
> Damien.
>
> Thomas Petazzoni a ?crit :
>> Hello Damien,
>>
>> On Fri, 05 Mar 2010 16:36:20 +0100
>> Damien Borie <dbe@terawatt.fr> wrote:
>>
>>  
>>> The situation : we use Buildroot to create a embedded distribution
>>> for a device with Touchscreen and a beautiful GUI.
>>> We've just changed the hardware for the same model has before, but
>>> with a larger screen. So now it's seems impossible to manage display
>>> with only the framebuffer and Vesa drivers. So I must create a new
>>> version of the distribution which will allow me to install the
>>> specific driver of the graphic chipset.
>>>     
>>
>> Ok.
>>
>>  
>>> As it's the same hardware (except screen, which only change size 
>>> anyway), I took the old configurations file (for Kernel, Busybox, 
>>> and Buildroot). I only add the option "Enable loadable module 
>>> support" in Kernel configuration, so I'll can install my drivers.
>>> In Buildroot configuration, I'm a bit lost but I only have to active
>>> X server. So I choose X Window system server "tinyX" instead of
>>> "none". Then I check "Xorg X window system X11r7 release 7.4"
>>> options, and choose xorg-server. And, that's all for a first test.
>>>     
>>
>> I think you're using an old version of Buildroot, because the options
>> are now organized in a different way (I've cleaned them up because
>> they were quite messy).
>>
>> Now, we have a top-level option
>>
>>  [ ] X.org X Window System, X11R7, release 7.4
>>
>> Inside this options, we have :
>>
>>  X Window System server type (TinyX)  --->
>>  X11R7 Servers  --->
>>  X11R7 Libraries --->
>>  X11R7 Applications -->
>>  X11R7 Fonts -->
>>  X11R7 X Protocols -->
>>  X11R7 Utilities -->
>>  X11R7 Other data -->
>>
>> So, once you've enabled X.org X Window System, X11R7, release 7.4, you
>> are able to choose the server type, and there you have two choices :
>>
>>  * TinyX, which is in fact now known as Kdrive. It is a standalone X
>>    server, which only supports a few hardware access solutions:
>>    framebuffer, VESA, etc. If you want video-card specific drivers,
>>    then, from my understanding, you cannot use TinyX/Kdrive
>>
>>  * The modular X.org, which is similar to the one you have in any
>>    Linux distro, which allows you to compile hardware-specific drivers.
>>    If you select this type, a new entry "X11R7 Drivers --->" will
>>    appear.
>>
>> In your case, you probably want the modular X.org.
>>
>>  
>>> Here comes the problem. During compiling, I got the following error
>>> log. I think it is strange that it is searching for a file with a
>>> long path like this, which doesn't exists of course. The file 
>>> /usr/local/toolchain/i486-twa-linux-gnu//usr/lib//libXau.la exists.
>>> I search for long hours but didn't found something really
>>> interesting. All I know is Libtool sometimes need to the librairies
>>> to be installed on the host to compile them successfully, so I just
>>> installed libXau but nothing changes.
>>>     
>>
>> No, libtool doesn't need the libraries to be installed on the host. It
>> might work-around some Buildroot issue, but it shouldn't be needed.
>>
>>  
>>> I really think the path is the problem, but I don't know how to
>>> change it as I'm not familiar at all with Libtool.
>>> Some advices for me?
>>>     
>>
>> Could you try with Buildroot 2010.02, and if it still doesn't work,
>> send us your .config ?
>>
>> Thanks!
>>
>> Thomas
>>   
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100309/3e4a50e5/attachment-0001.diff>
