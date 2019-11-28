From: Yi Zheng <goodmenzy@gmail.com>
Date: Thu, 28 Nov 2019 17:33:16 +0800
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
In-Reply-To: <CAFvCimXHMv94tg4S-U5QLu4k26HZAtZXsVR3jjK2C4s+XOuX2g@mail.gmail.com>
References: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
 <20191127214614.33d87ae0@windsurf>
 <CAFvCimXHMv94tg4S-U5QLu4k26HZAtZXsVR3jjK2C4s+XOuX2g@mail.gmail.com>
Message-ID: <CAJPHfYO4M=+mcQfmG0uStmfB9=CXwWPJxdzY46kOtn9LrRv_=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

  My last mail should be withdrawn.  Your info is important. The dependence
seems tricky.....

J?r?my ROSEN <jeremy.rosen@smile.fr> ?2019?11?28??? ??4:08???

> Hey all,
> Ok, as usuall some background knowledge
>
> systemd provides three binaries to deal with sending journal data over the
> network
>
> * systemd-journald-gateway : a tiny HTTP server that provides the logs
> * systemd-journald-upload : a process to run periodically to push the logs
> to a remote HTTP server
> * systemd-journald-remote : aprocess to run on the remorse computer (not
> on the target) to receive data and/or to fetch data from the target
>
> All three options are selected together with -Dremote=true (which is the
> default). It would be nice to be able to select them individually, but
> upstream does not provide that option.
>
> gatewayd is a bit more tricky because it will detect if libmicrohttpd is
> available and only builds if it is.
>
> So, as a fix I would make BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY depend
> on BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
> Also, fix default values to match previous behaviour
>
> Cheers
> Jeremy
>
>
> Le mer. 27 nov. 2019 ? 21:46, Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> a ?crit :
>
>> Hello,
>>
>> +Jeremy Rosen in Cc, for the systemd expertise.
>>
>> On Thu, 13 Jun 2019 11:05:27 +0800
>> Yi Zheng <goodmenzy@gmail.com> wrote:
>>
>> >     systemd-journal-remote was added in systemd v211, so add a new
>> option
>> >     to enable or disable it.
>> >
>> >     Signed-off-by: Yi Zheng <goodmenzy@gmail.com>
>>
>> Unfortunately, this commit seems to break things for some users. We
>> have a bug report at https://bugs.busybox.net/show_bug.cgi?id=12301.
>> Could you have a look ?
>>
>> J?r?my, what do you think ?
>>
>> Thanks,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
>
> --
> [image: SMILE]  <http://www.smile.eu/>
>
> 20 rue des Jardins
> 92600 Asni?res-sur-Seine
> *J?r?my ROSEN*
> Architecte technique
>
> [image: email] jeremy.rosen at smile.fr
> [image: phone]  +33 6 88 25 87 42
> [image: url] http://www.smile.eu
>
> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
> <https://www.facebook.com/smileopensource> [image: LinkedIn]
> <https://www.linkedin.com/company/smile> [image: Github]
> <https://github.com/Smile-SA>
>
> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191128/12b81f4a/attachment.html>
