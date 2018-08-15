From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 14:48:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang: fix illegal
 variable reference
In-Reply-To: <20180815143650.794906c2@windsurf>
References: <20180815071609.6722-1-mirza.krak@northern.tech>
 <20180815143650.794906c2@windsurf>
Message-ID: <CADHdJwCJj1EA-FCbbPZ0dsnmoVHiBvvSVP9Kxhm65eieRDQ4rQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 15, 2018 at 2:36 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Wed, 15 Aug 2018 09:16:09 +0200, Mirza Krak wrote:
>> References to variables inside $(eval) blocks must be with a double
>> dollar sign, otherwise we end up with unintuitive and undesired behavior
>> according to the description in pkg-generic.mk
>>
>> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
>> ---
>>  package/pkg-golang.mk | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> I hesitated a bit between applying to master or next. It is a bug fix,
> so it should be master. But it doesn't cause any visible issue for now,
> so maybe not master. In the end, since the fix is pretty trivial, I
> applied to master.
>
> However, I rewrote the commit log to provide (I believe) a better
> explanation of the issue being fixed.

Much better :). Thanks!

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
