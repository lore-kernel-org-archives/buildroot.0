From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 18 Dec 2009 13:04:18 +0100
Subject: [Buildroot] OT: git workflow question
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB670155DBC5@WETMEX10.loepfe.com>
References: <mailman.5919.1260994066.28478.buildroot@busybox.net>
	<1531E53627F1F749B4FE809BF2A4EB670155DBC5@WETMEX10.loepfe.com>
Message-ID: <4d28d4b50912180404k34f4fd41p6039bb0e6ea08a99@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I do use the same method than Thomas.
I maintain a local git branch with my patches. Before submitting them
to the list I made this :

#  Grab the local branch which tracks the official buildroot dev branch
git checkout master
# Pull from the buildroot repository to get an up to date image
git pull origin/master
# Rebase my branch on top of up to date buildroot dev branch
git rebase --onto master my_dev_branch_start my_dev_branch

Usually I dont get too much merges, but it depends how many people are
working on the same
packages than me...
The goal is to make the work of the maintainer easier. So your patches
get integrated faster,
and you remain happy :)

Then I submit my patches using :

git send-email master..my_dev_branch

In the pratice it's a little bit more complicated, because you dont
always want to send all your patches,
some of them are not yet ready, etc...

Regards,

--
Lionel Landwerlin

On Fri, Dec 18, 2009 at 9:08 AM, Vellemans, Noel
<Noel.Vellemans@visionbms.com> wrote:
> On 16 Dec, 2009 Thomas has written
>>
>>> Is this how git is supposed to work?
>
>>No. You should have made your changes in a separate branch instead of a
>>master branch. Then, you submit your patches. When they are merged, you
>>do "git pull" in your master branch. And then "git branch -d
>>yourbranch". If everything has been merged, "git branch -d" will
>>succeed, otherwise it will fail (and you can use "git branch -D" to
>>remove a branch that hasn't been merged).
>>
>>This is at least how I'm contributing to Buildroot. Not necessarly the
>>cleanest way, I'm no git expert.
>
>
> Thomas, this is a problem most of the 'NEW' users are facing.
>
> What is the correct way (or supposed correct way) of working with the
> buildroot-git, it's quit hard to get the 'picture' of you are not a git
> expert.
>
> Is there a known document (or url) that you can recommend, not that we
> all need/want te be git experts, but a guide that helps us in getting
> some basic git workflow would be nice.
>
>
> Regards Noel.
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
