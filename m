From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Apr 2014 07:18:08 +0200
Subject: [Buildroot] [RFC PATCH 0/2] gitorious helper
In-Reply-To: <20140429051126.GA32291@piout.net>
References: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
 <CAAXf6LWy3cXCxTLZcPo+pgXeHjNwc2+uVGyJZZLYJ8RP2rCFHA@mail.gmail.com>
 <20140110163510.1d2c8d8a@skate> <20140429051126.GA32291@piout.net>
Message-ID: <9a8529fc-851d-4302-9198-67a100db0f26@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexandre Belloni <alexandre.belloni@free-electrons.com> schreef:
>Hi,
>
>On 10/01/2014 at 16:35:10 +0800, Thomas Petazzoni wrote :
>> > 2. accept the fact that the URL cannot be changed, but modify the wget
>> > download helper so that it can rename the file after download
>> > (clarifying the list of files in dl/)
>> > 
>> > In the first alternative, the gitorious helper can be a one-liner just
>> > as for github, and the .mk files only need to specify FOO_SITE.
>> > In the second alternative, we need to set two variables FOO_SITE and
>> > FOO_SOURCE. In your current patchset, you have done this with one
>> > helper that sets both variables. As a result, the usage compared to
>> > the github helper is fundamentally different.
>> > For github:
>> > FOO_SITE = $(call github,username,package,$(FOO_VERSION))
>> > while for gitorious:
>> > $(call gitorious,username,package,$(FOO_VERSION)
>> > 
>> > I don't like this difference, and suggest two alternatives:
>> > A. split the helper in two, so that:
>> > FOO_SITE = $(call gitorious-site,username,package,$(FOO_VERSION))
>> > FOO_SOURCE = $(call gitorious-version,username,package,$(FOO_VERSION))
>> 
>> I very much prefer this solution. I don't really like the helper that
>> magically defines FOO_SITE and FOO_VERSION.
>> 
>
>After discussing quickly with Thomas, we feel that we can drop it as
>this would not really help with readability.

Readability wasn't the only reason such helpers were introduced. For github, the download urls changed a few times, and having it coded in only one place made changing this much easier.
So if that us the only reason I prefer to keep this patch. I'm willing to adopt it by the way...

Best regards,
Thomas
