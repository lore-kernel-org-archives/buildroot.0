From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun, 03 Jul 2016 21:12:02 +0800
Subject: [Buildroot] [PATCH v3] package/quagga: Add systemd.service file
In-Reply-To: <CAGduivybX+jzD8MehC+T1hQWjFurH2=641ETsX3C7Vh1+688uQ@mail.gmail.com>
References: <1467533939-26606-1-git-send-email-nroach44@gmail.com>
 <CAGduivyM5Y4TBVos3Pz8bW-7KeZc0RQA+uTbDQtXrA0tR-sR+A@mail.gmail.com>
 <55ce8415-62de-2e1e-bc88-f35d511866ec@gmail.com>
 <CAGduivweAB_oyvVutnw18Sry0mUdi_eapL-RUSZUtRVyEiH8Cw@mail.gmail.com>
 <f1ecfb6a-1adc-4f51-35e1-3fed8c054607@gmail.com>
 <CAGduivybX+jzD8MehC+T1hQWjFurH2=641ETsX3C7Vh1+688uQ@mail.gmail.com>
Message-ID: <1B32F450-41C3-4F3B-9B48-821E360C9235@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ah, another case of me misinterpreting defaults. This can also be removed if it's preferred to leave it as default.

On 3 July 2016 9:09:39 PM AWST, Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:
>On Sun, Jul 3, 2016 at 3:06 PM, Nathaniel Roach <nroach44@gmail.com>
>wrote:
>> Oh, and it's not 0 such that it won't restart and hog resources quite
>as
>> badly if it's instantly dieing.
>>
>The default is 100ms, do you think that's still too fast ? Usually
>it's enough but if you encounter problem and 1s is the shortest it can
>do, then 1s it is.
>
>Other than that:
>Reviewed-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>[...]
>>>>>> +EnvironmentFile=/etc/default/quagga-%i
>>>>>> +PrivateTmp=true
>>>>>> +# Systemd doesn't like having %i in the executable path.
>>>>>> +ExecStart=/usr/bin/env /usr/sbin/%i $OPTS -f /etc/quagga/%i.conf
>>>>>> +ExecReload=/bin/kill -HUP $MAINPID
>>>>>> +KillMode=mixed
>>>>>> +KillSignal=SIGINT
>>>>>
>>>>> If I understand correctly, what you want to do is send a SIGINT to
>the
>>>>> main processes and SIGKILL to the other ? From the services file I
>can
>>>>> find in major distro, they don't specify it so it's left to the
>>>>> default SIGTERM, why did you need to change that ? (Maybe you
>already
>>>>> explained in your previous mail and I missed, sorry if that's the
>>>>> case).
>>>>
>>>> KillMode=Mixed is an artefact left over from the OpenVPN .service
>file I
>>>> used as a reference. I (again) misread the systemd docs and left it
>in as
>>>> it
>>>> seemed more appropriate than the default if any child processes are
>>>> started.
>>>> This can be removed on commit, or I'll fix it if there's any other
>things
>>>> that need to be changed.
>[...]
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160703/7807af0b/attachment.html>
