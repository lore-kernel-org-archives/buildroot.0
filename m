From: Kuten Ivan <ivan.kuten@promwad.com>
Date: Fri, 19 Oct 2007 09:21:01 -0100
Subject: [Buildroot] svn At revision 20289 breakage
In-Reply-To: <4718671F.3040005@asist.si>
References: <4717A47F.4000908@asist.si>	<4717C93A.3080401@promwad.com><0c3501c811c4$63522850$01c4af0a@Glamdring><4717D0BA.1050300@promwad.com><0c5901c811c6$8aecca30$01c4af0a@Glamdring>	<4718510D.5030602@asist.si>	<008201c81224$6c96bd80$01c4af0a@Glamdring>
	<4718671F.3040005@asist.si>
Message-ID: <4718850D.9020302@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Babarovic Ivica wrote:
> Ulf Samuelsson wrote:
>> It is always the case that you have to provide a ".config" file for 
>> linux.
>>
>> For some lucky souls Buildroot will do it for you.
>> This is when there is an appropriate definition somewhere in the 
>> target directory,
>> and if you have supplied the right kernel.
> Well, I guess I was lucky until now. I never provided any kernel or 
> .config files.
> I still fail to see why this is important for buildroot build. Kernel 
> headers?
> 
> I have a .config file from a kernel I build. Should I put that into 
> buildroot process?
> What differences would it make?
>> For some unlucky souls, they now have an option to start a "make xconfig"
>> to get a window allowing them to configure things instead of having a 
>> failed build.
>>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

As for me, I'm not using building kernel in buildroot - I'm building it separately.
And with recent changes made by Ulf, we have only to regenerate our .config buildroot config
and to select Kernel -> "none". And I have buildroot build OK again.
The only thing that Ulf forget to warn people that if they have old buildroot .config
they must regenerate it and select kernel .config or kernel none , otherwise you will get that error
messages when doing cp.

Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
