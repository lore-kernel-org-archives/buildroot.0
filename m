From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 12 Mar 2016 10:11:29 +0100
Subject: [Buildroot] [PATCH v7 04/18] core: staging symlink uses a
 relative path when possible
In-Reply-To: <20160310214723.0eb96ec9@free-electrons.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-5-git-send-email-s.martin49@gmail.com>
 <20160310214723.0eb96ec9@free-electrons.com>
Message-ID: <CAHXCMMJdrtn5GGRFnESQbT4bUOcjVmHj8r0NAvSKkDPP4CJhCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Thu, Mar 10, 2016 at 9:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Samuel,
>
> On Wed,  9 Mar 2016 23:58:45 +0100, Samuel Martin wrote:
>> This change turns the staging/ symlink to a relative one when
>> $(STAGING_DIR) points to some location in the Buildroot's output
>> directory (i.e.: in $(BASE_DIR)/).
>>
>> In any other case, the symlink target remains the absolute path
>> to the sysroot location.
>>
>> This slight change is a step forward toward a relocatable SDK.
>
> Why is this important for a relocatable SDK ? The SDK is $(HOST_DIR),
> and the staging symlink is just a convenience symlink which sits
> outside of $(HOST_DIR), and hence outside the SDK.
Right, but what about consistency in BR? if we do all the job for
having a full relocatable SDK, why should we keep this symlink an
absolute one?
Also, one of my tests in the relocatable SDK work is moving around the
whole output directory; so I need this patch in this case. Maybe this
is not a valid case?

Regards,

-- 
Samuel
