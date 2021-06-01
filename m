From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Jun 2021 16:39:36 +0200
Subject: [Buildroot] [PATCHv3 06/15] package/sysrepo: remove explicit
 setting of CMAKE_BUILD_TYPE
In-Reply-To: <CAAXf6LVcWAOgB6HCUbzNJCRhb20L96Xz=DRkFTOGXq7mFqEVKQ@mail.gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-7-patrickdepinguin@gmail.com>
 <d3098530-47bb-c944-b226-275d64ff4591@mind.be>
 <CAAXf6LVcWAOgB6HCUbzNJCRhb20L96Xz=DRkFTOGXq7mFqEVKQ@mail.gmail.com>
Message-ID: <d12e55e8-97c7-9eab-5070-9bc6f8853d10@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/06/2021 16:24, Thomas De Schampheleire wrote:
> El mar, 25 may 2021 a las 22:56, Arnout Vandecappelle
> (<arnout@mind.be>) escribi?:
>>
>>
>>
>> On 25/05/2021 14:27, Thomas De Schampheleire wrote:
>>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>>
>>> sysrepo explicitly sets CMAKE_BUILD_TYPE=Release, ignoring any possible
>>> value of BR2_ENABLE_DEBUG (previously) or BR2_ENABLE_RUNTIME_DEBUG (now).
>>>
>>> With the introduction of BR2_ENABLE_RUNTIME_DEBUG, this change should no
>>> longer be necessary. Users that do not wish to have additional runtime
>>> debugging just keep BR2_ENABLE_RUNTIME_DEBUG disabled (default value).
>>>
>>> As the 'Debug' build type enables tests, disable them explicitly.
>>> As the 'Debug' build type uses a custom REPO_PATH which does not exist on
>>> target, force /etc/sysrepo like in the 'Release' build type.
>>>
>>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>
>> Although I think this could have been squashed with the previous patch.
> 
> I thought a separate patch was intended based on your comment:
> http://patchwork.ozlabs.org/comment/2633317/

 Good point! I should have already applied patch 5.

 Regards,
 Arnout

> 
> In v4 I'm sending the patch still separated but feel free to squash it.
> 
> Thanks,
> Thomas
> 
