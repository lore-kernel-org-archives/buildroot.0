From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 26 Jan 2015 12:07:42 +0100
Subject: [Buildroot] [PATCH 1/3] dmalloc: Force arm mode instead of
	Thumb1 mode
In-Reply-To: <20150125203111.23d005b2@free-electrons.com>
References: <1421753079-27665-1-git-send-email-richard.genoud@gmail.com>
 <20150125203111.23d005b2@free-electrons.com>
Message-ID: <CACQ1gAj44T_KaGN3ZToxjiQGj3P_ghJwbjxxRRWTA2jAqVR9bA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-01-25 20:31 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Richard Genoud,
>
> On Tue, 20 Jan 2015 12:24:37 +0100, Richard Genoud wrote:
>> dmalloc has some assembly that doesn't exist in thumb1 mode.
>> So, force arm mode for dmalloc.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>> ---
>>  package/dmalloc/dmalloc.mk | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>
> Applied, thanks.
>
> Are you actually using an ARMv4/ARMv5 Thumb system?
I tried to use it to know if it saves some place on my RFS, but as Qt
has the same kind of problem with Thumb1, it didn't make a big
difference.
(my platform is a sam9g35, so ARMv5)
But if I continue to have spaces problem, I will reconsider using
thumb1, and maybe try to patch the Qt assembly to make it Thumb1
compliant instead of adding " -marm"

> Maybe this is a configuration we should add to our autobuilders, since
> it's currently not even build-tested.
That may be a good idea since I may not be the only potential user :)
