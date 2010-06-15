From: Damien Borie <dbe@terawatt.fr>
Date: Tue, 15 Jun 2010 14:26:00 +0200
Subject: [Buildroot] [Re:  Valgrind compilation, with patch 3.5.0,
 need help]
In-Reply-To: <4C1760DD.8020001@terawatt.fr>
References: <4C1726CE.8080009@terawatt.fr>
	<20100615093736.1872e8e7@surf>	<4C174EB3.5070902@terawatt.fr>
	<4C1760DD.8020001@terawatt.fr>
Message-ID: <4C177158.7040009@terawatt.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's ok. Valgrind is compiled and works OK. Finally I've commented all 
test on /proc/self/* files in 'configure' file, else it says that it 
cannot test in cross compiling and exit. And it's work.

Thanks!

Damien Borie

TERAWATT / AENERGIA S.A.S.
ZA DUBOSCOA
64990 Villefranque
FRANCE 

tel : +33 (0)5 59 44 26 08
fax : +33 (0)5 59 31 15 11 



Damien Borie a ?crit :
> Ok I've applied successfully the patch 'bump to 3.5.0' and the large 
> file patch. But I still have the same error
> 'checking for /proc/self/fd... configure: error: cannot check for file 
> existence when cross compiling'
> In 'configure' file, I can see that it result of a test of variable 
> 'cross-compiling'. If true, this error appears. I wonder if i can 
> comment this and ignore this test...
>
> Damien Borie
>
> TERAWATT / AENERGIA S.A.S.
> ZA DUBOSCOA
> 64990 Villefranque
> FRANCE
> tel : +33 (0)5 59 44 26 08
> fax : +33 (0)5 59 31 15 11
>
>
> Damien Borie a ?crit :
>> Thanks!
>>
>> Well, this patch seems to work. But then, the compilation doesn't 
>> works. It returns with this error :
>> 'checking for /proc/self/fd... configure: error: cannot check for 
>> file existence when cross compiling'
>> I know I had this error in the past on other packages, but I don't 
>> remember how to fix it.
>> Note that I don't apply the patch 'valgrind.patch' because it cause 
>> errors. The only patch applied is 'valgrind-3.5.0-largefile.patch'.
>> Yesterday, I found a patch in the mailing list named 'valgrind bump 
>> to 3.5.0' (link : 
>> http://lists.busybox.net/pipermail/buildroot/2010-April/033673.html) 
>> but I didn't succeed in applying it. I'm not sure but I think it will 
>> patch vargrind.patch and vargrind.mk to work with 3.5.0 version.
>> But how to apply it?
>>
>> Damien Borie
>>
>> TERAWATT / AENERGIA S.A.S.
>> ZA DUBOSCOA
>> 64990 Villefranque
>> FRANCE
>> tel : +33 (0)5 59 44 26 08
>> fax : +33 (0)5 59 31 15 11
>>
>>
>> Thomas Petazzoni a ?crit :
>>> Hello Damien,
>>>
>>> On Tue, 15 Jun 2010 09:07:58 +0200
>>> Damien Borie <dbe@terawatt.fr> wrote:
>>>
>>>  
>>>> So, I tried to compile Valgrind version 3.5.0. I only change the 
>>>> version
>>>> number in Config.in file (in package/valgrind/). 'make source' 
>>>> cause the
>>>> package download without problems. Then 'make' doesn't cause error but
>>>> it try to apply a patch ('valgrind-largefile patch'). This patch 
>>>> modify
>>>> a file 'coregrind/m_ume.c' and ask me to type a path to a file to 
>>>> patch,
>>>> with no others precisions.
>>>>     
>>>
>>> It means that the file the patch is modifying doesn't exist anymore in
>>> newer versions of Valgrind. So you need to see whether the patch is
>>> still needed or not. From a quick look, it looks like it does.
>>>
>>> Attached is a updated version of the patch for Valgrind 3.5.0. I 
>>> haven't
>>> tested it *at all*, I haven't even built Valgrind with this patch. But
>>> at least, it applies on Valgrind 3.5.0.
>>>
>>> Regards,
>>>
>>> Thomas
>>>   
>>> ------------------------------------------------------------------------ 
>>>
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
