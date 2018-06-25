From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 25 Jun 2018 23:08:15 +0200
Subject: [Buildroot] sun8i-h3: sunxi-mali-mainline package with
 linux-next
In-Reply-To: <CAMty3ZBTob3VJir5pRvpuKnKdrO06Q+5+U+wOygxEg8iYaBFbQ@mail.gmail.com>
References: <CAMty3ZDZucZpr-4M=CCc9nLM=XTKGr5qySDe4Zq5O7t_xov+Jg@mail.gmail.com>
 <a3dc995f-c1a7-6cc9-e1c9-cefdf590a659@micronovasrl.com>
 <88dade5a-99bb-bb6b-7aaf-4561568b2840@micronovasrl.com>
 <CAMty3ZBTob3VJir5pRvpuKnKdrO06Q+5+U+wOygxEg8iYaBFbQ@mail.gmail.com>
Message-ID: <e0abe57c-9554-04be-7118-fdb063de9096@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jagan,

Il 25/06/2018 15:35, Jagan Teki ha scritto:
> On Fri, Jun 22, 2018 at 4:58 PM, Giulio Benetti
> <giulio.benetti@micronovasrl.com> wrote:
>> Hi Jagan,
>>
>> Il 22/06/2018 12:45, Giulio Benetti ha scritto:
>>>
>>> Resend, I was not subscribed to ML sorry.
>>>
>>> Hi Jagan,
>>>
>>> Il 21/06/2018 19:22, Jagan Teki ha scritto:
>>>>
>>>> Hi,
>>>>
>>>> I'm trying to use sunxi-mali-mainline with linux-next for H3 platform.
>>>>
>>>> Since Mali dt support is already added on linux-next, So I've directly
>>>> used buildroot and enabled necessary options.
>>>
>>>
>>> I would suggest you to use master branch or at least 4.17 version instead
>>> of linux-next.
>>> But I'm not sure this is the root-cause.
>>> Maybe give it a try if you can.
>>>
>>>>
>>>> Look like Mali initialization seems failing. I've not investigated
>>>> further but just to post if anyone found this already and seeking for
>>>> help.
>>>>
>>>> Log:
>>>> # modprobe -a mali
>>
>>
>> Driver is loaded automatically on boot,
>> since during install it is added to /lib/modules/extras
>> Are you sure you're not trying to modprobe twice?
>> Can you post lsmod before modprobe?
>> It should be already loaded.
>>
>> If it's already loaded and not working can you post your dmesg?
> 
> I've tried with 4.17.2 please find the dmesg[1]
> 
> [1] https://paste.ubuntu.com/p/Y5GtCP4Tjj/
> 

Ok, so on Buildroot side it's ok.
I ask you to open an issue on https://github.com/mripard/sunxi-mali

Thanks
Giulio
