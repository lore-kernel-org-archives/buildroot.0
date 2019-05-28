From: Mirza Krak <mirza.krak@northern.tech>
Date: Tue, 28 May 2019 20:47:40 +0200
Subject: [Buildroot] [PATCH 2/2] package/mender: better default
 mender.config
In-Reply-To: <CADHdJwAMPDp6UUwS+sXNbi2C9xwhpWMaC5QdxrAbLjtha9NWKQ@mail.gmail.com>
References: <20190528134105.30572-1-deinok@deinok.com>
 <20190528134105.30572-2-deinok@deinok.com>
 <bc22f4e8-6547-5d9a-a50b-f60c42cf438c@mind.be>
 <CADHdJwAMPDp6UUwS+sXNbi2C9xwhpWMaC5QdxrAbLjtha9NWKQ@mail.gmail.com>
Message-ID: <CADHdJwAjJhV4hK09uhQeDvVyCzoxWt++8TffNaN9EfUtRSFwdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 28, 2019 at 8:42 PM Mirza Krak <mirza.krak@northern.tech> wrote:
>
> On Tue, May 28, 2019 at 8:28 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>  Hi Raul,
>>
>> On 28/05/2019 15:41, deinok at deinok.com wrote:
>> > From: Raul Hidalgo Caballero <deinok@deinok.com>
>> >
>>
>>  Please give a better explanation than "better" :-). The summary line is OK, but
>> the body of the commit message should specify why it is better. Even if the
>> explanation is obvious, like I say below.
>>
>> > Signed-off-by: Raul Hidalgo Caballero <deinok@deinok.com>
>> > ---
>> >  package/mender/mender.conf | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/package/mender/mender.conf b/package/mender/mender.conf
>> > index 979f16aaf6..7eb9fb18b4 100644
>> > --- a/package/mender/mender.conf
>> > +++ b/package/mender/mender.conf
>> > @@ -2,9 +2,9 @@
>> >    "InventoryPollIntervalSeconds": 1800,
>> >    "UpdatePollIntervalSeconds": 1800,
>> >    "RetryPollIntervalSeconds": 300,
>> > -  "RootfsPartA": "mmcblk0p2",
>> > -  "RootfsPartB": "mmcblk0p3",
>> > +  "RootfsPartA": "/dev/mmcblk0p1",
>> > +  "RootfsPartB": "/dev/mmcblk0p2",
>>
>>  This one seems kind of obvious...
>>
>>  Mirza, how is it possible that this used to work for you?
>
>
> I actually sent out a patch recently fixing this as well [1], as I noticed this and it is a bug. I guess I did not notice earlier as I had this file provided trough an "rootfs_overlay" (with correct paths)
>
>>
>>
>> >    "ServerCertificate": "/etc/mender/server.crt",
>> > -  "ServerURL": "https://docker.mender.io",
>> > +  "ServerURL": "https://hosted.mender.io",
>>
>>  This one is also obvious: docker.mender.io doesn't exist, and according to
>> wayback machine it never did. Well, it doesn't know hosted.mender.io either and
>> that one definitely exists, so maybe it just changed name. Mirza?
>
>
> The "docker.mender.io" URL is actually is valid when you use the Mender Demo environment [1] and what you typically do is the following:
>
>      echo "192.168.1.120 docker.mender.io s3.docker.mender.io" >> /etc/hosts
>
> There is also a demo certificate (servert.crt [3]) which is installed by default and this certificate is only valid for "docker.mender.io and s3.docker.mender.io" and this is the reason on why this was the default URL. I did mention this in the commit message when this file was updated [4]
>
> [1]. https://patchwork.ozlabs.org/patch/1099369/
> [2]. https://docs.mender.io/2.0/getting-started/create-a-test-environment
> [3]. https://github.com/buildroot/buildroot/blob/dd97b055b11b8708438974555d1746a18924ceba/package/mender/server.crt
> [4]. https://github.com/buildroot/buildroot/commit/9b297505eb7992965c32dc2cf1d083f26b563246#diff-320fbe73257a3e8f47413a56ef19b7de

Sorry, previous email was sent as HTML.

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
