From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Nov 2013 09:15:13 +0100
Subject: [Buildroot] [PATCH] manual: clarify that Config.in comments
 should have correct dependencies
In-Reply-To: <CAHXCMM+xVzgujFzU7=3YQpuu=2YvJyWWc0bvy3ncG=aA4-RwqQ@mail.gmail.com>
References: <94085e779250785b8986.1383597255@argentina>
 <CAHXCMM+xVzgujFzU7=3YQpuu=2YvJyWWc0bvy3ncG=aA4-RwqQ@mail.gmail.com>
Message-ID: <CAAXf6LVKOz=xz3YW7kuBFbDbOYRX2jBphZRacn5La331HC0KnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Mon, Nov 4, 2013 at 10:26 PM, Samuel Martin <s.martin49@gmail.com> wrote:

>> +
>>  These dependencies have to expressed with the appropriate 'depends on'
>
> s/have to expressed/have to be expressed/

Hmm, seems we missed this in the original patch.
But I will fix it nevertheless, thanks.

>
>>  statements in the Config.in file. Additionally, for dependencies on
>>  toolchain options, a +comment+ should be displayed when the option is
>> @@ -180,6 +181,14 @@ made visible in a comment: since it is u
>>  freely choose another target, it makes little sense to show these
>>  dependencies explicitly.
>>
>> +The +comment+ should only be visible if the +config+ option itself would
>> +be visible when the toolchain option dependencies are met. This means
>> +that all other dependencies of the package (including dependencies on
>> +target architecture and MMU support) have to be repeated on the
>> ++comment+ definition. To keep it clear, the +depends on+ statement for
>> +these non-toolchain option should be kept separate from the +depends on+
>> +statement for the toolchain options.
>> +
>>  The general format of a dependency +comment+ for package foo is:
>>  --------------------------
>>  foo needs a toolchain w/ featA, featB, featC
>
>
> Acked-by: Samuel Martin <s.martin49@gmail.com>
> (with this little fix ;))
>

Thanks,
Thomas
