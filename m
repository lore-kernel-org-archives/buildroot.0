From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 10 Apr 2017 21:20:10 +0200
Subject: [Buildroot] [PATCH 1/1] xenomai: Add choice for Cobalt/Mercury
	core
In-Reply-To: <99d84995-3497-3072-f56a-bea2960327c6@mind.be>
References: <20170406234139.31532-1-sikor6@gmail.com>
 <20170406234139.31532-2-sikor6@gmail.com>
 <20170408153452.54837e4c@free-electrons.com>
 <2fa9e5f3-79a9-090e-76ed-457be2e6e49a@mind.be>
 <CAKfV1CaoGUPmL6W5xT61YECuVvN3_RthyD7sw8Cw54e_RMOYCQ@mail.gmail.com>
 <99d84995-3497-3072-f56a-bea2960327c6@mind.be>
Message-ID: <CAAXf6LXi32-nEe0TqvXdJX61j=ELmSu4Fi7QfWOOuF7_RYMRDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 10, 2017 at 11:08 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 10-04-17 00:51, Pawel Sikora wrote:
>> What about support for Xenomai 2.6? Should we split Xenomai into two packages
>> for both versions? As it needs different patches that are currently for 3.x version
>> and now if someone want to build 2.x will need to take these patches manually.
>> So doesn't it really mean now, that the option with prompt for Xenomai version
>> will work only for Xenomai >3.x?
>
>  IIRC when Xenomai 3 support was introduced, we decided to simply drop support
> for Xenomai 2.6.
>
>  In fact, I would forego the 'custom Xenomai version' support entirely. I don't
> see why you would ever want an older version, and if you need a newer version
> than the one in Buildroot you can just bump the package. Does anyone see a
> reason to support multiple versions? [Adding ThomasDS in Cc to answer that.]
>

[sorry for the earlier mail problems, seems the Gmail Android app has
been 'improved' to mess up inline replies...]

In the past, there have been several cases where updates were made to
the Mercury core of Xenomai that required changes in existing
applications. Possibly this depended on how exactly you link to it and
which startup options you give, but anyway this is a situation where
being able to select a non-latest xenomai version can be useful, at
least in a transition phase.

Best regards,
Thomas
