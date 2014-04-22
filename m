From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:35:52 +0200
Subject: [Buildroot] [PATCH] pkg-cmaketargets.mk: do not hardcode
 absolute path in toolchainfile.cmake
In-Reply-To: <53569F10.3000304@mind.be>
References: <1393694162-21952-1-git-send-email-s.martin49@gmail.com>
 <531429C3.80801@mind.be>
 <CAHXCMMKkF2h1g3-+jqwDmQ7VddTd5qa=_hWaagc17H5AewQHDA@mail.gmail.com>
 <53569F10.3000304@mind.be>
Message-ID: <CAHXCMMJMKw9z-aHP7Fm4K5R-FB38JDQS99FzeAu4sNKs5s+=UA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

On Tue, Apr 22, 2014 at 6:55 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
[...]
>  Right, I forgot that the backslash is still passed. This would work, but
> is not much better:
>
> @printf \
> 'get_filename_component(_HOST_DIR $${CMAKE_CURRENT_LIST_FILE} PATH)\n'\
> '...'\
>
>
>  Or this works as well:
>
>  @printf '$(subst $(sep),\n,$(TOOLCHAINFILE_CMAKE))' > $@
>
>
> define TOOLCHAINFILE_CMAKE
>   get_filename_component(_HOST_DIR $${CMAKE_CURRENT_LIST_FILE} PATH)
>   ...
> endef
>
>  But I'm not 100% convinced that that is better either.
>

Thanks a lot for the tips.

I think I'll go for the 2nd solution, with the least quotes and the
content of "define ... endef" the closest to the one of the
toolchainfile.cmake file (only $ needs to be escaped).

However I have no strong opinion about this, so if someone thinks to a
better solution, please speak up.

Regards,

-- 
Samuel
