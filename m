From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Nov 2013 21:28:43 +0100
Subject: [Buildroot] [PATCH 3/7] eigen: fix install rules
In-Reply-To: <CAHXCMMKFgTOaW2LhcdYEAvQgFHY0mtqdjSYC1pLUvQjetKt_6Q@mail.gmail.com>
References: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
 <1384203613-17871-4-git-send-email-s.martin49@gmail.com>
 <20131111233358.58088a11@skate> <5281D7C1.8080900@mind.be>
 <CAHXCMMKFgTOaW2LhcdYEAvQgFHY0mtqdjSYC1pLUvQjetKt_6Q@mail.gmail.com>
Message-ID: <CAHXCMM+JLYaKZVR4K4+5yUjjz12cU33ycKO+v-7+ek40rCtfXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/12 Samuel Martin <s.martin49@gmail.com>

> Thomas, Arnout, all,
>
> Eigen is one of the rare package that does not support in-source-tree
> build.
> But this can be worked around quite easily.
>
> Also, after a (not so) quick look at the cmake from the eigen package,
> most of the
> check/test/bench/doc/... builds can be disabled, but not all (need to be
> confirmed).
>
> BTW, Thomas, what is the status of your work on out-of-source-tree build?
>
> 2013/11/12 Arnout Vandecappelle <arnout@mind.be>
>
>> On 11/11/13 23:33, Thomas Petazzoni wrote:
>>
>>> Dear Samuel Martin,
>>>
>>> On Mon, 11 Nov 2013 22:00:09 +0100, Samuel Martin wrote:
>>>
>>>  diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
>>>> index 5abd464..63e21e9 100644
>>>> --- a/package/eigen/eigen.mk
>>>> +++ b/package/eigen/eigen.mk
>>>> @@ -16,8 +16,14 @@ EIGEN_INSTALL_TARGET = NO
>>>>   # This package only consists of headers that need to be
>>>>   # copied over to the sysroot for compile time use
>>>>   define EIGEN_INSTALL_STAGING_CMDS
>>>> -       $(RM) -r $(STAGING_DIR)/usr/include/Eigen
>>>> -       cp -a $(@D)/Eigen $(STAGING_DIR)/usr/include/
>>>> +       for d in Eigen unsupported ; do \
>>>>
>>> Installing the unsupported directory was mainly for opencv.

Since, I rejected the opencv patch, there no need anymore for this one, so,
I rejected it too.
If someone someday needs it, it will still be in the ml archive and in
patchwork.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131115/0a607dc1/attachment-0001.html>
