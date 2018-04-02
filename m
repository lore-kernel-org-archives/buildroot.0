From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 2 Apr 2018 15:07:50 -0500
Subject: [Buildroot] [PATCH v3 3/3] setools: update to add sedta and
 seinfoflow
In-Reply-To: <20180325224407.75fe7c26@windsurf>
References: <1521578383-56128-1-git-send-email-jared.bents@rockwellcollins.com>
 <1521578383-56128-3-git-send-email-jared.bents@rockwellcollins.com>
 <20180325224407.75fe7c26@windsurf>
Message-ID: <CANQCQpaB482Qae3M_8b0N3tq2pdAfWPD-HbrYUh5eN8vZNUyKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Mar 25, 2018 at 3:44 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Tue, 20 Mar 2018 15:39:43 -0500, Jared Bents wrote:
>
>> diff --git a/package/setools/Config.in b/package/setools/Config.in
>> index ae0c45f..32a9315 100644
>> --- a/package/setools/Config.in
>> +++ b/package/setools/Config.in
>> @@ -8,6 +8,7 @@ config BR2_PACKAGE_SETOOLS
>>       depends on BR2_USE_MMU
>>       select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
>>       select BR2_PACKAGE_PYTHON_ENUM34 if !BR2_PACKAGE_PYTHON3
>> +     select BR2_PACKAGE_PYTHON_NETWORKX
>
> I've added a # runtime comment here to explain that this is only a
> runtime dependency, and applied to master.
>
> However, I'm wondering if it wouldn't have made sense to add a
> sub-option for this. We generally try to avoid having too many
> dependencies in Buildroot packages, and this commit adds a new
> dependency that isn't strictly necessary, as long as you don't need
> those two tools. I'm not saying we /must/ add such a sub-option, I'm
> just asking.
>

It actually turned out it was a missed dependency and until we
actually used it at runtime, we didn't notice.

Matt
